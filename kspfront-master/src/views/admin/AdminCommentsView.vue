<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

const comments = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

// 详情对话框
const detailDialogVisible = ref(false)
const currentComment = ref(null)

// 筛选条件
const filterForm = ref({
  keyword: '',
  commentableType: '',
  isPublic: ''
})

// 评论类型选项
const commentTypes = [
  { label: '帖子评论', value: 1 },
  { label: '合集评论', value: 2 },
  { label: '评论回复', value: 3 }
]

// 评论状态选项
const commentStatus = [
  { label: '私密', value: 0 },
  { label: '公开', value: 1 }
]

// 获取评论列表
const getComments = async () => {
  loading.value = true
  try {
    const params = {
      current: currentPage.value,
      size: pageSize.value,
      ...filterForm.value
    }
    
    // 移除空值
    Object.keys(params).forEach(key => {
      if (params[key] === '') {
        delete params[key]
      }
    })

    const response = await request.get('/api/admin/management/comment/list', {
      params
    })
    comments.value = response.records
    total.value = response.total
  } catch (error) {
    console.error('获取评论列表失败:', error)
    ElMessage.error('获取评论列表失败')
  } finally {
    loading.value = false
  }
}

// 更新评论状态
const updateCommentStatus = async (id, status) => {
  try {
    await request.put(`/api/admin/management/comment/${id}/status/${status}`)
    ElMessage.success('更新状态成功')
    getComments()
  } catch (error) {
    console.error('更新状态失败:', error)
    ElMessage.error('更新状态失败')
  }
}

// 查看评论详情
const viewCommentDetail = async (id) => {
  try {
    const response = await request.get(`/api/admin/management/comment/${id}`)
    currentComment.value = response
    detailDialogVisible.value = true
  } catch (error) {
    console.error('获取评论详情失败:', error)
    ElMessage.error('获取评论详情失败')
  }
}

// 删除评论
const deleteComment = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除该评论吗？此操作不可恢复', '警告', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    
    await request.delete(`/api/admin/management/comment/${id}`)
    ElMessage.success('删除成功')
    getComments()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除失败:', error)
      ElMessage.error('删除失败')
    }
  }
}

// 处理筛选
const handleFilter = () => {
  currentPage.value = 1
  getComments()
}

// 重置筛选
const resetFilter = () => {
  filterForm.value = {
    keyword: '',
    commentableType: '',
    isPublic: ''
  }
  currentPage.value = 1
  getComments()
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  getComments()
}

// 处理每页条数变化
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getComments()
}

onMounted(() => {
  getComments()
})
</script>

<template>
  <div class="comments-container">
    <!-- 筛选栏 -->
    <el-card class="filter-card">
      <el-form :model="filterForm" inline>
   
        <el-form-item label="评论类型">
          <el-select v-model="filterForm.commentableType" placeholder="全部类型" clearable style="width: 120px;">
            <el-option
              v-for="type in commentTypes"
              :key="type.value"
              :label="type.label"
              :value="type.value"
            />
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="评论状态">
          <el-select v-model="filterForm.isPublic" placeholder="全部状态" clearable style="width: 120px;">
            <el-option
              v-for="status in commentStatus"
              :key="status.value"
              :label="status.label"
              :value="status.value"
            />
          </el-select>
        </el-form-item> -->
        <el-form-item>
          <el-button type="primary" @click="handleFilter">筛选</el-button>
          <el-button @click="resetFilter">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <!-- 评论列表 -->
    <el-card class="list-card">
      <el-table
        :data="comments"
        v-loading="loading"
        style="width: 100%"
        border
      >
        <el-table-column label="评论内容" min-width="200">
          <template #default="{ row }">
            <div class="comment-info">
              <div class="comment-user">
                <el-avatar :size="32" :src="row.commenterAvatar" />
                <span class="username">{{ row.commenterName }}</span>
                <span class="user-id">(ID: {{ row.commenterId }})</span>
              </div>
              <div class="comment-content">{{ row.content }}</div>
              <div class="comment-meta">
                <span>评论时间: {{ row.creationTime }}</span>
                <el-divider direction="vertical" />
                <span>点赞: {{ row.likeCount }}</span>
                <el-divider direction="vertical" />
                <span>回复: {{ row.replyCount }}</span>
              </div>
              <div class="comment-target" v-if="row.commentableTitle">
                <span>评论对象: {{ row.commentableTitle }}</span>
                <template v-if="row.replyToCommenterName">
                  <el-divider direction="vertical" />
                  <span>回复: {{ row.replyToCommenterName }}</span>
                </template>
              </div>
            </div>
          </template>
        </el-table-column>
        
        <el-table-column label="评论类型" width="100">
          <template #default="{ row }">
            <el-tag :type="row.commentableType === 1 ? 'primary' : row.commentableType === 2 ? 'success' : 'warning'">
              {{ commentTypes.find(t => t.value === row.commentableType)?.label }}
            </el-tag>
          </template>
        </el-table-column>

        <el-table-column label="状态" width="180">
          <template #default="{ row }">
            <div class="status-tags">
              <el-tag :type="row.isPublic === 1 ? 'success' : 'danger'" size="small">
                {{ row.isPublic === 1 ? '公开' : '私密' }}
              </el-tag>
              <el-tag :type="row.isDeleted === 1 ? 'danger' : 'success'" size="small">
                {{ row.isDeleted === 1 ? '已删除' : '正常' }}
              </el-tag>
              <el-tag :type="row.reviewStatus === 1 ? 'success' : 'warning'" size="small">
                {{ row.reviewStatus === 1 ? '已审核' : '待审核' }}
              </el-tag>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="操作" width="250" fixed="right">
          <template #default="{ row }">
            <el-button
              :type="row.isPublic === 1 ? 'warning' : 'success'"
              size="small"
              @click="updateCommentStatus(row.id, row.isPublic === 1 ? 0 : 1)"
            >
              {{ row.isPublic === 1 ? '隐藏' : '显示' }}
            </el-button>
            <el-button
              type="primary"
              size="small"
              @click="viewCommentDetail(row.id)"
            >
              详情
            </el-button>
            <el-button
              type="danger"
              size="small"
              @click="deleteComment(row.id)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="pagination">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          :total="total"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
          <template #total>
            共 {{ total }} 条，第 {{ currentPage }}/{{ Math.ceil(total/pageSize) }} 页
          </template>
        </el-pagination>
      </div>
    </el-card>

    <!-- 评论详情对话框 -->
    <el-dialog
      v-model="detailDialogVisible"
      title="评论详情"
      width="600px"
    >
      <div v-if="currentComment" class="comment-detail">
        <div class="detail-section">
          <h4>评论者信息</h4>
          <div class="detail-content">
            <div class="user-info">
              <el-avatar :size="40" :src="currentComment.commenterAvatar" />
              <div class="user-text">
                <div class="name">{{ currentComment.commenterName }}</div>
                <div class="id">ID: {{ currentComment.commenterId }}</div>
              </div>
            </div>
          </div>
        </div>

        <div class="detail-section">
          <h4>评论内容</h4>
          <div class="detail-content">
            <div class="comment-text">{{ currentComment.content }}</div>
            <div class="comment-info">
              <span>发布时间：{{ currentComment.creationTime }}</span>
              <span>点赞数：{{ currentComment.likeCount }}</span>
              <span>回复数：{{ currentComment.replyCount }}</span>
            </div>
          </div>
        </div>

        <div class="detail-section">
          <h4>评论对象</h4>
          <div class="detail-content">
            <div class="target-info">
              <div>标题：{{ currentComment.commentableTitle }}</div>
              <div>类型：{{ commentTypes.find(t => t.value === currentComment.commentableType)?.label }}</div>
              <div v-if="currentComment.replyToCommenterName">
                回复：{{ currentComment.replyToCommenterName }}
              </div>
            </div>
          </div>
        </div>

        <div class="detail-section">
          <h4>状态信息</h4>
          <div class="detail-content status-info">
            <el-tag :type="currentComment.isPublic === 1 ? 'success' : 'danger'">
              {{ currentComment.isPublic === 1 ? '公开' : '私密' }}
            </el-tag>
            <el-tag :type="currentComment.isDeleted === 1 ? 'danger' : 'success'">
              {{ currentComment.isDeleted === 1 ? '已删除' : '正常' }}
            </el-tag>
            <el-tag :type="currentComment.reviewStatus === 1 ? 'success' : 'warning'">
              {{ currentComment.reviewStatus === 1 ? '已审核' : '待审核' }}
            </el-tag>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
.comments-container {
  padding: 24px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.filter-card {
  margin-bottom: 16px;
}

.list-card {
  margin-bottom: 16px;
}

.comment-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.comment-user {
  display: flex;
  align-items: center;
  gap: 8px;
}

.username {
  font-weight: 500;
  color: #303133;
}

.user-id {
  color: #909399;
  font-size: 13px;
}

.comment-content {
  color: #303133;
  font-size: 14px;
  line-height: 1.4;
  background-color: #f5f7fa;
  padding: 8px 12px;
  border-radius: 4px;
}

.comment-meta,
.comment-target {
  font-size: 13px;
  color: #909399;
  display: flex;
  align-items: center;
  gap: 8px;
}

.status-tags {
  display: flex;
  gap: 4px;
}

:deep(.el-avatar) {
  border: 1px solid #ebeef5;
  background-color: #f5f7fa;
}

.mx-2 {
  margin: 0 8px;
}

/* 表格样式 */
:deep(.el-table) {
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
}

:deep(.el-table th) {
  background-color: #f5f7fa !important;
  color: #606266;
  font-weight: 500;
}

/* 分页样式 */
.pagination {
  margin-top: 16px;
  display: flex;
  justify-content: flex-end;
}

@media screen and (max-width: 768px) {
  .comments-container {
    padding: 12px;
  }
  
  .filter-card :deep(.el-form-item) {
    margin-bottom: 12px;
  }
}

/* 详情对话框样式 */
.comment-detail {
  padding: 0 20px;
}

.detail-section {
  margin-bottom: 24px;
}

.detail-section h4 {
  margin: 0 0 12px 0;
  color: #303133;
  font-size: 16px;
  font-weight: 500;
}

.detail-content {
  background-color: #f5f7fa;
  padding: 16px;
  border-radius: 4px;
}

.user-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.user-text .name {
  font-weight: 500;
  color: #303133;
  margin-bottom: 4px;
}

.user-text .id {
  font-size: 13px;
  color: #909399;
}

.comment-text {
  font-size: 14px;
  line-height: 1.6;
  color: #303133;
  margin-bottom: 12px;
}

.comment-info {
  display: flex;
  gap: 16px;
  font-size: 13px;
  color: #909399;
}

.target-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
  font-size: 14px;
  color: #606266;
}

.status-info {
  display: flex;
  gap: 8px;
}

:deep(.el-dialog__body) {
  padding-top: 20px;
}
</style> 