<script setup>
import { ref, onMounted, watch } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

// 列表数据
const posts = ref([])
const loading = ref(true)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

// 分区和标签数据
const sections = ref([])
const tags = ref([])
const selectedSection = ref(1)
const selectedTag = ref('')
const keyword = ref('')

// 帖子状态选项
const statusOptions = [
  { label: '草稿', value: 0 },
  { label: '已发布', value: 1 }
]

// 审核状态选项
const reviewStatusOptions = [
  { label: '待审核', value: 0 },
  { label: '已通过', value: 1 },
  { label: '已拒绝', value: 2 }
]

// 可见性选项
const visibilityOptions = [
  { label: '私密', value: 0 },
  { label: '公开', value: 1 }
]

// 帖子内容相关
const postContent = ref('')
const contentLoading = ref(false)

// 格式化时间
const formatDateTime = (time) => {
  if (!time) return ''
  return time.replace('T', ' ')
}

// 获取分区名称
const getSectionName = (sectionId) => {
  const section = sections.value.find(s => s.id === sectionId)
  return section ? section.name : `未知分区`
}

// 获取所有分区
const getSections = async () => {
  try {
    const response = await request.get('/api/admin/management/post/all')
    if (response) {
      sections.value = response.map(section => ({
        id: section.id,
        name: section.sectionName,
        description: section.sectionDescription
      }))
    } else {
      sections.value = []
      ElMessage.warning('获取分区数据格式异常')
    }
  } catch (error) {
    console.error('获取分区列表失败:', error)
    ElMessage.error('获取分区列表失败')
  }
}

// 获取分区下的标签
const getTags = async (sectionId) => {
  if (!sectionId) {
    tags.value = []
    return
  }
  try {
    const response = await request.get(`/api/admin/management/post/${sectionId}/tags`)
    if (Array.isArray(response)) {
      tags.value = response.map(tag => ({
        id: tag.id,
        name: tag.tagName || `标签${tag.id}`
      }))
    } else {
      tags.value = []
      ElMessage.warning('获取标签数据格式异常')
    }
  } catch (error) {
    console.error('获取标签列表失败:', error)
    ElMessage.error('获取标签列表失败')
  }
}

// 获取帖子列表
const getPosts = async () => {
  if (!selectedSection.value) {
    posts.value = []
    total.value = 0
    return
  }
  
  loading.value = true
  try {
    const url = keyword.value 
      ? `/api/admin/management/post/${selectedSection.value}/posts/search`
      : `/api/admin/management/post/${selectedSection.value}/posts`
    
    const response = await request.get(url, {
      params: {
        keyword: keyword.value || undefined,
        tagId: selectedTag.value || undefined,
        current: currentPage.value,
        size: pageSize.value
      }
    })
    if (response) {
      posts.value = response.records || []
      total.value = response.total || 0
    } else {
      posts.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取帖子列表失败:', error)
    ElMessage.error('获取帖子列表失败')
    posts.value = []
    total.value = 0
  } finally {
    loading.value = false
  }
}

// 删除帖子
const deletePost = async (postId) => {
  try {
    await ElMessageBox.confirm('确定要删除该帖子吗？此操作不可恢复', '警告', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await request.delete(`/api/admin/management/post/${postId}`)
    ElMessage.success('删除帖子成功')
    getPosts()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除帖子失败:', error)
      ElMessage.error('删除帖子失败')
    }
  }
}

// 更新帖子状态
const updatePostStatus = async (post) => {
  try {
    await request.put(`/api/admin/management/post/update/${post.id}`, {
      isDeleted: post.isDeleted === 1 ? 0 : 1
    })
    ElMessage.success('更新帖子状态成功')
    getPosts()
  } catch (error) {
    console.error('更新帖子状态失败:', error)
    ElMessage.error('更新帖子状态失败')
  }
}

// 监听分区变化
watch(selectedSection, (newVal) => {
  selectedTag.value = ''
  getTags(newVal)
  getPosts()
})

// 监听标签变化
watch(selectedTag, () => {
  getPosts()
})

// 处理页码改变
const handleCurrentChange = (page) => {
  currentPage.value = page
  getPosts()
}

// 处理每页条数改变
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getPosts()
}

// 重置筛选条件
const resetFilter = () => {
  keyword.value = ''
  selectedTag.value = ''
  currentPage.value = 1
  getPosts()
}

// 处理筛选
const handleFilter = () => {
  currentPage.value = 1
  getPosts()
}

// 帖子详情相关
const detailDialogVisible = ref(false)
const currentPost = ref(null)

// 获取帖子内容
const getPostContent = async (filePath) => {
  if (!filePath) {
    postContent.value = ''
    return
  }
  
  contentLoading.value = true
  try {
    console.log('加载帖子内容文件:', filePath)
    const response = await fetch(filePath)
    if (!response.ok) throw new Error('加载内容失败')
    const html = await response.text()
    postContent.value = html
  } catch (error) {
    console.error('加载帖子内容失败:', error)
    ElMessage.error('加载帖子内容失败')
    postContent.value = ''
  } finally {
    contentLoading.value = false
  }
}

// 查看帖子详情
const viewPostDetail = async (postId) => {
  try {
    const response = await request.get(`/api/system/post/${postId}`)
    if (response) {
      currentPost.value = response
      detailDialogVisible.value = true
      // 获取帖子内容
      if (response.contentFilePath) {
        await getPostContent("http://jg85768183.vicp.fun:30562/content/"+ response.contentFilePath)
      }
    }
  } catch (error) {
    console.error('获取帖子详情失败:', error)
    ElMessage.error('获取帖子详情失败')
  }
}

onMounted(() => {
  getSections()
  getTags(selectedSection.value)
  getPosts()
})
</script>

<template>
  <div class="posts-manage">
    <!-- 筛选条件卡片 -->
    <el-card shadow="never" class="filter-card">
      <div class="filter-form">
        <el-form :inline="true">
          <el-form-item label="分区">
            <el-select 
              v-model="selectedSection" 
              placeholder="请选择分区"
              clearable
              @clear="selectedSection = null"
              style="width: 180px"
            >
              <el-option
                v-for="section in sections"
                :key="section.id"
                :label="section.name"
                :value="section.id"
              />
            </el-select>
          </el-form-item>
          
          <el-form-item label="标签">
            <el-select 
              v-model="selectedTag"
              placeholder="请选择标签"
              clearable
              :disabled="!selectedSection"
              style="width: 180px"
            >
              <el-option
                v-for="tag in tags"
                :key="tag.id"
                :label="tag.name"
                :value="tag.id"
              />
            </el-select>
          </el-form-item>
          
          <el-form-item label="关键词">
            <el-input
              v-model="keyword"
              placeholder="请输入关键词"
              clearable
              @keyup.enter="handleFilter"
              style="width: 200px"
            />
          </el-form-item>
          
          <el-form-item>
            <el-button type="primary" @click="handleFilter">查询</el-button>
            <el-button @click="resetFilter">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-card>

    <!-- 数据表格卡片 -->
    <el-card shadow="never" class="table-card">
      <el-table
        :data="posts"
        style="width: 100%"
        v-loading="loading"
      >
        <el-table-column prop="id" label="ID" width="80" />
        
        <el-table-column prop="title" label="标题" min-width="200" show-overflow-tooltip />
        
        <el-table-column prop="userId" label="作者ID" width="100" />
        
        <el-table-column label="分区" width="120">
          <template #default="{ row }">
            {{ getSectionName(row.sectionId) }}
          </template>
        </el-table-column>
        
        <el-table-column prop="tags" label="标签" width="150" show-overflow-tooltip />
        
        <el-table-column label="统计信息" width="280">
          <template #default="{ row }">
            <div class="stats-info">
              <el-tooltip content="浏览量">
                <span>👁️ {{ row.viewCount }}</span>
              </el-tooltip>
              <el-tooltip content="评论数">
                <span>💬 {{ row.commentCount }}</span>
              </el-tooltip>
              <el-tooltip content="点赞数">
                <span>👍 {{ row.likeCount }}</span>
              </el-tooltip>
              <el-tooltip content="分享数">
                <span>🔄 {{ row.shareCount }}</span>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>
        
        <el-table-column label="发布时间" width="160">
          <template #default="{ row }">
            {{ formatDateTime(row.publishTime) }}
          </template>
        </el-table-column>
        
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'info'">
              {{ statusOptions.find(item => item.value === row.status)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="审核状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.reviewStatus === 0 ? 'info' : row.reviewStatus === 1 ? 'success' : 'danger'">
              {{ reviewStatusOptions.find(item => item.value === row.reviewStatus)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="可见性" width="80">
          <template #default="{ row }">
            <el-tag :type="row.visibility === 1 ? 'success' : 'info'">
              {{ visibilityOptions.find(item => item.value === row.visibility)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="特殊标记" width="120">
          <template #default="{ row }">
            <el-tag v-if="row.isPinned" type="warning" class="ml-2">置顶</el-tag>
            <el-tag v-if="row.isEssence" type="success" class="ml-2">精华</el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button
              type="primary"
              size="small"
              @click="viewPostDetail(row.id)"
            >
              详情
            </el-button>
            <el-button
              type="danger"
              size="small"
              class="ml-2"
              @click="deletePost(row.id)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 添加分页组件 -->
      <div class="pagination-container">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          :total="total"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </el-card>
  </div>

  <!-- 帖子详情对话框 -->
  <el-dialog
    v-model="detailDialogVisible"
    title="帖子详情"
    width="800px"
    destroy-on-close
  >
    <div v-if="currentPost" class="post-detail">
      <div class="detail-header">
        <h2 class="detail-title">{{ currentPost.title }}</h2>
        <div class="detail-meta">
          <span>作者ID: {{ currentPost.userId }}</span>
          <span>分区: {{ getSectionName(currentPost.sectionId) }}</span>
          <span>发布时间: {{ formatDateTime(currentPost.publishTime) }}</span>
        </div>
        <div class="detail-tags" v-if="currentPost.tags">
          <el-tag
            v-for="tag in currentPost.tags.split(',')"
            :key="tag"
            size="small"
            class="tag-item"
          >
            {{ tag.trim() }}
          </el-tag>
        </div>
      </div>

      <div class="detail-content">
        <div class="content-section">
          <h3>基本信息</h3>
          <div class="info-grid">
            <div class="info-item">
              <span class="info-label">合集ID</span>
              <span class="info-value">{{ currentPost.collectionId || '无' }}</span>
            </div>
            <div class="info-item">
              <span class="info-label">内容文件ID</span>
              <span class="info-value">{{ currentPost.contentFileId || '无' }}</span>
            </div>
            <div class="info-item">
              <span class="info-label">内容文件路径</span>
              <span class="info-value">{{ currentPost.contentFilePath || '无' }}</span>
            </div>
            <div class="info-item">
              <span class="info-label">引用信息</span>
              <span class="info-value">{{ currentPost.citation || '无' }}</span>
            </div>
            <div class="info-item">
              <span class="info-label">更新时间</span>
              <span class="info-value">{{ formatDateTime(currentPost.updateTime) }}</span>
            </div>
          </div>
        </div>

        <div class="content-section">
          <h3>统计信息</h3>
          <div class="stats-grid">
            <div class="stat-item">
              <span class="stat-label">浏览量</span>
              <span class="stat-value">{{ currentPost.viewCount }}</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">评论数</span>
              <span class="stat-value">{{ currentPost.commentCount }}</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">点赞数</span>
              <span class="stat-value">{{ currentPost.likeCount }}</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">分享数</span>
              <span class="stat-value">{{ currentPost.shareCount }}</span>
            </div>
          </div>
        </div>

        <div class="content-section">
          <h3>状态信息</h3>
          <div class="status-grid">
            <div class="status-item">
              <span class="status-label">状态</span>
              <el-tag :type="currentPost.status === 1 ? 'success' : 'info'">
                {{ statusOptions.find(item => item.value === currentPost.status)?.label }}
              </el-tag>
            </div>
            <div class="status-item">
              <span class="status-label">审核状态</span>
              <el-tag :type="currentPost.reviewStatus === 0 ? 'info' : currentPost.reviewStatus === 1 ? 'success' : 'danger'">
                {{ reviewStatusOptions.find(item => item.value === currentPost.reviewStatus)?.label }}
              </el-tag>
            </div>
            <div class="status-item">
              <span class="status-label">可见性</span>
              <el-tag :type="currentPost.visibility === 1 ? 'success' : 'info'">
                {{ visibilityOptions.find(item => item.value === currentPost.visibility)?.label }}
              </el-tag>
            </div>
          </div>
          <div class="special-tags" v-if="currentPost.isPinned || currentPost.isEssence">
            <el-tag v-if="currentPost.isPinned" type="warning">置顶</el-tag>
            <el-tag v-if="currentPost.isEssence" type="success">精华</el-tag>
          </div>
        </div>

        <div class="content-section" v-if="currentPost.cover">
          <h3>封面图片</h3>
          <div class="cover-image">
            <img :src="currentPost.cover" :alt="currentPost.title">
          </div>
        </div>

        <div class="content-section">
          <h3>帖子内容</h3>
          <div class="post-content">
            <el-skeleton :loading="contentLoading" animated>
              <template #default>
                <div v-if="postContent" class="content-html" v-html="postContent"></div>
                <el-empty v-else description="暂无内容"></el-empty>
              </template>
            </el-skeleton>
          </div>
        </div>
      </div>
    </div>
    
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="detailDialogVisible = false">关闭</el-button>
        <el-button type="primary" @click="window.open(`/post/${currentPost?.id}`, '_blank')">
          查看原文
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<style scoped>
.posts-manage {
  padding: 24px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.filter-card {
  margin-bottom: 16px;
}

.filter-form {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.table-card {
  margin-bottom: 16px;
}

.stats-info {
  display: flex;
  gap: 12px;
  font-size: 14px;
}

.stats-info span {
  display: flex;
  align-items: center;
  gap: 4px;
  color: #606266;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

.ml-2 {
  margin-left: 8px;
}

@media screen and (max-width: 768px) {
  .posts-manage {
    padding: 12px;
  }
  
  .filter-form {
    gap: 8px;
  }
}

.post-detail {
  padding: 20px;
}

.detail-header {
  margin-bottom: 24px;
}

.detail-title {
  margin: 0 0 16px;
  font-size: 24px;
  color: #303133;
}

.detail-meta {
  display: flex;
  gap: 16px;
  color: #909399;
  font-size: 14px;
  margin-bottom: 12px;
}

.detail-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 12px;
}

.content-section {
  margin-bottom: 24px;
}

.content-section h3 {
  font-size: 16px;
  color: #303133;
  margin: 0 0 12px;
  padding-bottom: 8px;
  border-bottom: 1px solid #ebeef5;
}

.stats-grid, .status-grid, .info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 16px;
  margin-bottom: 16px;
}

.stat-item, .status-item, .info-item {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding: 12px;
  background-color: #f5f7fa;
  border-radius: 4px;
}

.stat-label, .status-label, .info-label {
  font-size: 14px;
  color: #909399;
}

.stat-value, .status-value, .info-value {
  font-size: 14px;
  color: #303133;
  word-break: break-all;
}

.special-tags {
  margin-top: 16px;
  display: flex;
  gap: 8px;
}

.cover-image {
  width: 100%;
  max-height: 300px;
  overflow: hidden;
  border-radius: 4px;
}

.cover-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
}

.post-content {
  margin-top: 16px;
  padding: 16px;
  background-color: #fff;
  border-radius: 4px;
  border: 1px solid #ebeef5;
}

.content-html {
  line-height: 1.6;
  font-size: 14px;
  color: #303133;
  
  ::v-deep(img) {
    max-width: 100%;
    height: auto;
  }
  
  ::v-deep(p) {
    margin: 1em 0;
  }
  
  ::v-deep(h1, h2, h3, h4, h5, h6) {
    margin: 1.5em 0 1em;
    font-weight: 500;
  }
  
  ::v-deep(pre) {
    background-color: #f5f7fa;
    padding: 16px;
    border-radius: 4px;
    overflow-x: auto;
  }
  
  ::v-deep(code) {
    background-color: #f5f7fa;
    padding: 2px 4px;
    border-radius: 2px;
  }
  
  ::v-deep(table) {
    width: 100%;
    border-collapse: collapse;
    margin: 1em 0;
    
    th, td {
      border: 1px solid #ebeef5;
      padding: 8px;
      text-align: left;
    }
    
    th {
      background-color: #f5f7fa;
    }
  }
  
  ::v-deep(blockquote) {
    margin: 1em 0;
    padding: 8px 16px;
    border-left: 4px solid #409eff;
    background-color: #ecf5ff;
    color: #606266;
  }
}
</style> 