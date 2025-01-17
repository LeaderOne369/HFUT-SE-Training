<script setup>
import { ref, onMounted } from 'vue'
import SectionApi from '@/api/client/section-api.js'
import PostItem from '@/components/PostItem.vue'
import { ElMessage } from 'element-plus'
import { ElSkeleton, ElSkeletonItem } from 'element-plus'
import { useRoute } from 'vue-router'

const route = useRoute()
const loading = ref(false)
const posts = ref([])
const sections = ref([])
const currentSection = ref(1)

// 获取所有分区
const getAllSections = async () => {
  try {
    const data = await SectionApi.getAllSections()
    console.log('获取到的分区数据:', data)
    if (data) {
      sections.value = Array.isArray(data) ? data : []
    }
  } catch (error) {
    console.error('获取分区列表失败:', error)
    sections.value = []
    ElMessage.error('获取分区列表失败')
  }
}

// 获取分区帖子列表
const getSectionPosts = async (sectionId) => {
  loading.value = true
  try {
    console.log('获取分区帖子，分区ID:', sectionId)
    const data = await SectionApi.searchPostsBySection(sectionId, {
      current: 1,
      size: 999
    })
    console.log('获取到的帖子数据:', data)
    if (data && data.records) {
      posts.value = data.records.map(post => ({
        post: { ...post },
        author: {
          username: '用户' + post.userId,
          avatarUrl: '/images/default-avatar.png'
        }
      }))
    }
  } catch (error) {
    console.error('获取分区内容失败:', error)
    posts.value = []
    ElMessage.error('获取分区内容失败')
  } finally {
    loading.value = false
  }
}

// 切换分区
const handleSectionChange = (sectionId) => {
  console.log('切换到分区:', sectionId)
  currentSection.value = sectionId
  getSectionPosts(sectionId)
}

onMounted(() => {
  getAllSections()
  // 获取路由中的分区ID，如果没有则使用默认值1
  const sectionId = parseInt(route.params.id) || 1
  currentSection.value = sectionId
  getSectionPosts(sectionId)
})
</script>

<template>
  <div class="category-view">
    <!-- 分区导航 -->
    <div class="section-nav">
      <h2 class="section-title">{{ sections.find(s => s.id === currentSection)?.sectionName }}</h2>
      <div class="section-buttons">
        <el-button
          v-for="section in sections"
          :key="section.id"
          :class="['section-button', { active: currentSection === section.id }]"
          @click="handleSectionChange(section.id)"
          :title="section.sectionDescription"
        >
          {{ section.sectionName }}
        </el-button>
      </div>
    </div>

    <!-- 骨架屏 -->
    <template v-if="loading && posts.length === 0">
      <div class="skeleton-container" v-for="i in 3" :key="i">
        <el-skeleton animated>
          <template #template>
            <div class="skeleton-item">
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
        </el-skeleton>
      </div>
    </template>

    <!-- 帖子列表 -->
    <div class="post-list" v-else>
      <transition-group name="post-list">
        <post-item
          v-for="post in posts"
          :key="post.id"
          :post="post"
          class="post-item"
        />
      </transition-group>
    </div>

    <!-- 无数据提示 -->
    <div class="no-data" v-if="!loading && posts.length === 0">
      <el-empty 
        description="暂无内容" 
        :image-size="200"
      />
    </div>
  </div>
</template>

<style scoped>
.category-view {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  background-color: #f5f7fa;
  min-height: 100vh;
  box-sizing: border-box;
}

.section-nav {
  margin-bottom: 24px;
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.section-title {
  margin: 0 0 20px;
  font-size: 22px;
  font-weight: 600;
  color: #1a1a1a;
}

.section-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  padding-bottom: 8px;
  justify-content: flex-start;
}

.section-button {
  height: 24px;
  width: 80px;
  flex: 0 0 80px;
  padding: 0 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
  line-height: 24px;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  border: none;
  background: #f5f5f5;
  color: #666;
  display: flex;
  align-items: center;
  justify-content: center;
}

.section-button:hover {
  transform: translateY(-2px);
  background: #eee;
  color: #1a1a1a;
}

.section-button.active {
  color: #fff;
  background: #1a1a1a;
  font-weight: 600;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* 为不同分区设置不同的颜色 */
.section-button:nth-child(6n+1):not(.active) {
  background: #f0f7ff;
  color: #2468f2;
}

.section-button:nth-child(6n+2):not(.active) {
  background: #fff7e6;
  color: #fa8c16;
}

.section-button:nth-child(6n+3):not(.active) {
  background: #f6ffed;
  color: #52c41a;
}

.section-button:nth-child(6n+4):not(.active) {
  background: #fff1f0;
  color: #f5222d;
}

.section-button:nth-child(6n+5):not(.active) {
  background: #f9f0ff;
  color: #722ed1;
}

.section-button:nth-child(6n+6):not(.active) {
  background: #e6fffb;
  color: #13c2c2;
}

.section-button:nth-child(6n+1):hover {
  background: #e6f0ff;
}

.section-button:nth-child(6n+2):hover {
  background: #fff1cc;
}

.section-button:nth-child(6n+3):hover {
  background: #e6ffdb;
}

.section-button:nth-child(6n+4):hover {
  background: #ffe6e6;
}

.section-button:nth-child(6n+5):hover {
  background: #f2e6ff;
}

.section-button:nth-child(6n+6):hover {
  background: #ccfffc;
}

/* 响应式设计 */
@media screen and (max-width: 768px) {
  .category-view {
    padding: 12px;
  }

  .section-nav {
    padding: 16px;
    margin-bottom: 20px;
    border-radius: 12px;
  }

  .section-title {
    margin: 0 0 16px;
    font-size: 18px;
  }

  .section-buttons {
    gap: 4px;
  }

  .section-button {
    height: 22px;
    width: 70px;
    flex: 0 0 70px;
    line-height: 22px;
    padding: 0 6px;
    font-size: 11px;
    border-radius: 3px;
  }
}

.post-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.post-item {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
  margin: 0;
  padding: 20px;
}

.post-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
}

.skeleton-container {
  margin-bottom: 16px;
}

.skeleton-item {
  padding: 20px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.no-data {
  padding: 40px 0;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

/* 列表动画 */
.post-list-enter-active,
.post-list-leave-active {
  transition: all 0.3s ease;
}

.post-list-enter-from {
  opacity: 0;
  transform: translateY(30px);
}

.post-list-leave-to {
  opacity: 0;
  transform: translateY(-30px);
}

@media screen and (max-width: 768px) {
  .post-item {
    padding: 16px;
    border-radius: 8px;
  }

  .skeleton-item {
    padding: 16px;
    border-radius: 8px;
  }

  .no-data {
    padding: 30px 0;
    border-radius: 8px;
  }
}
</style>