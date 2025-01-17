<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import SearchApi from '@/api/client/search-api'
import { ElEmpty } from 'element-plus'
import PostItem from '@/components/PostItem.vue'

const route = useRoute()
const loading = ref(false)
const posts = ref([])
const pagination = ref({
  current: 1,
  size: 10,
  total: 0
})

// 处理ES搜索结果数据
const processSearchResult = (hit) => {
  const post = hit.source
  return {
    post: {
      ...post,
      title: hit.highlight?.title?.[0] || post.title,
      summary: hit.highlight?.summary?.[0] || post.summary
    },
    author: {
      id: post.userId,
      username: `用户${post.userId}`,
      avatarUrl: '/images/default-avatar.png'
    }
  }
}

// 获取搜索结果
const getSearchResults = async () => {
  const keyword = route.query.keyword
  if (!keyword) return
  
  loading.value = true
  try {
    const response = await SearchApi.searchPostsByES({
      keyword,
      page: pagination.value.current,
      size: pagination.value.size
    })
    
    if (response) {
      posts.value = response.records.map(processSearchResult)
      pagination.value.total = response.total || 0
    }
  } catch (error) {
    console.error('搜索失败:', error)
  } finally {
    loading.value = false
  }
}

// 处理页码变化
const handlePageChange = (current) => {
  pagination.value.current = current
  getSearchResults()
}

// 处理每页显示数量变化
const handleSizeChange = (size) => {
  pagination.value.size = size
  pagination.value.current = 1
  getSearchResults()
}

// 监听路由参数变化
watch(
  () => route.query.keyword,
  () => {
    pagination.value.current = 1
    getSearchResults()
  }
)

onMounted(() => {
  getSearchResults()
})
</script>

<template>
  <div class="search-view">
    <div class="search-header">
      <h2>搜索结果: {{ route.query.keyword }}</h2>
      <div class="result-count">共 {{ pagination.total }} 条结果</div>
    </div>

    <div class="search-content">
      <el-skeleton :loading="loading" animated :count="3">
        <template #template>
          <div class="post-skeleton">
            <el-skeleton-item variant="image" style="width: 240px; height: 180px" />
            <div style="padding: 14px">
              <el-skeleton-item variant="h3" style="width: 50%" />
              <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 8px">
                <el-skeleton-item variant="text" style="margin-right: 16px" />
                <el-skeleton-item variant="text" style="width: 30%" />
              </div>
            </div>
          </div>
        </template>

        <template #default>
          <div v-if="posts.length > 0" class="post-list">
            <transition-group name="post-list">
              <post-item
                v-for="post in posts"
                :key="post.post.id"
                :post="post"
                class="post-item"
              />
            </transition-group>
          </div>
          <el-empty v-else description="暂无搜索结果"/>
        </template>
      </el-skeleton>

      <div class="pagination" v-if="pagination.total > 0">
        <el-pagination
          v-model:current-page="pagination.current"
          v-model:page-size="pagination.size"
          :page-sizes="[10, 20, 50]"
          :total="pagination.total"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handlePageChange"
        />
      </div>
    </div>
  </div>
</template>

<style scoped>
.search-view {
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 60px);
  box-sizing: border-box;
}

.search-header {
  margin-bottom: 20px;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
  width:1200px;
}

.search-header h2 {
  font-size: 24px;
  color: #303133;
  margin: 0 0 8px 0;
}

.result-count {
  font-size: 14px;
  color: #909399;
}

.search-content {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
}

.post-skeleton {
  padding: 20px;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  margin-bottom: 16px;
  background: #fff;
}

.post-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.post-item {
  border-radius: 8px;
  transition: all 0.3s ease;
}

.post-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

:deep(.post-item) {
  margin-bottom: 16px;
}

:deep(.post-item:last-child) {
  margin-bottom: 0;
}

:deep(.highlight) {
  color: #409eff;
  font-weight: bold;
}

.pagination {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

/* 列表动画 */
.post-list-enter-active,
.post-list-leave-active {
  transition: all 0.3s ease;
}

.post-list-enter-from,
.post-list-leave-to {
  opacity: 0;
  transform: translateY(30px);
}

@media screen and (max-width: 768px) {
  .search-view {
    padding: 10px 20px;
  }

  .search-header,
  .search-content {
    padding: 15px;
    border-radius: 6px;
  }

  .post-skeleton,
  .post-item {
    border-radius: 6px;
  }
}
</style> 