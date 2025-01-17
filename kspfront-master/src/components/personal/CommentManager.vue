<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete, View } from '@element-plus/icons-vue'
import PersonalCommentApi from '@/api/client/personal-comment-api.js'

// 评论管理
const commentType = ref('published') // 'published' | 'received'
const comments = ref([])
const commentsLoading = ref(false)
const pagination = ref({
  current: 1,
  size: 5,
  total: 0
})
const showDetailDialog = ref(false)
const currentComment = ref(null)

// 获取评论列表
const getCommentList = async () => {
  commentsLoading.value = true
  try {
    const response = await (commentType.value === 'published' 
      ? PersonalCommentApi.getPublishedComments({
          current: pagination.value.current,
          size: pagination.value.size
        })
      : PersonalCommentApi.getReceivedComments({
          current: pagination.value.current,
          size: pagination.value.size
        }))
    
    if (response) {
      comments.value = response.records || []
      pagination.value = {
        current: response.current,
        size: response.size,
        total: response.total
      }
    } else {
      comments.value = []
      pagination.value.total = 0
    }
  } catch (error) {
    console.error('获取评论列表失败:', error)
    ElMessage.error('获取评论列表失败')
  } finally {
    commentsLoading.value = false
  }
}

// 处理分页变化
const handlePageChange = (current) => {
  pagination.value.current = current
  getCommentList()
}

const handleSizeChange = (size) => {
  pagination.value.size = size
  pagination.value.current = 1
  getCommentList()
}

// 删除评论
const handleDeleteComment = async (commentId) => {
  try {
    await ElMessageBox.confirm(
      '确定要删除这条评论吗？',
      '警告',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
    )
    
    await PersonalCommentApi.deleteComment(commentId)
    ElMessage.success('删除成功')
    getCommentList()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除评论失败:', error)
      ElMessage.error('删除评论失败')
    }
  }
}

// 切换评论类型
const handleCommentTypeChange = (type) => {
  commentType.value = type
  getCommentList()
}

// 获取评论详情
const handleViewDetail = async (commentId) => {
  try {
    const response = await PersonalCommentApi.getCommentDetail(commentId)
    if (response) {
      currentComment.value = response
      showDetailDialog.value = true
    }
  } catch (error) {
    console.error('获取评论详情失败:', error)
    ElMessage.error('获取评论详情失败')
  }
}

onMounted(() => {
  getCommentList()
})

// 组件卸载前的清理
onBeforeUnmount(() => {
  comments.value = []
  commentsLoading.value = false
  commentType.value = 'published'
  currentComment.value = null
  showDetailDialog.value = false
})
</script>

<template>
  <div class="content-section">
    <div class="section-header">
      <el-tabs v-model="commentType" @tab-change="handleCommentTypeChange">
        <el-tab-pane label="我发布的" name="published" />
        <el-tab-pane label="我收到的" name="received" />
      </el-tabs>
    </div>
    <div class="comment-list" v-loading="commentsLoading">
      <div v-if="comments.length > 0" class="comment-items">
        <div v-for="comment in comments" :key="comment.id" class="comment-item">
          <div class="comment-content">{{ comment.content }}</div>
          <div class="comment-info">
            <div class="comment-meta">
              <span class="comment-time">{{ new Date(comment.creationTime).toLocaleString() }}</span>
              <span class="comment-visibility">{{ comment.isPublic ? '公开' : '私密' }}</span>
              <span v-if="comment.reviewStatus === 0" class="review-status">审核中</span>
              <span v-else-if="comment.reviewStatus === 2" class="review-status rejected">已拒绝</span>
              <span v-if="comment.parentCommentId" class="reply-info">回复评论：#{{ comment.parentCommentId }}</span>
              <span class="comment-stats">
                <span><el-icon><Star /></el-icon> {{ comment.likeCount || 0 }}点赞</span>
                <span><el-icon><ChatLineSquare /></el-icon> {{ comment.replyCount || 0 }}回复</span>
              </span>
            </div>
            <div class="comment-actions">
              <el-button 
                type="primary"
                :icon="View"
                circle
                size="small"
                @click="handleViewDetail(comment.id)"
              />
              <el-button 
                v-if="commentType === 'published'"
                type="danger" 
                :icon="Delete" 
                circle 
                size="small"
                @click="handleDeleteComment(comment.id)"
              />
            </div>
          </div>
        </div>
      </div>
      <div v-else class="no-comments">
        <p>{{ commentType === 'published' ? '还没有发布过评论~' : '还没有收到评论~' }}</p>
      </div>

      <!-- 分页 -->
      <el-pagination
        v-if="pagination.total > 0"
        v-model:current-page="pagination.current"
        v-model:page-size="pagination.size"
        :page-sizes="[5, 10, 20]"
        :total="pagination.total"
        layout="total, sizes, prev, pager, next"
        @size-change="handleSizeChange"
        @current-change="handlePageChange"
        background
        class="pagination"
      />
    </div>

    <!-- 评论详情对话框 -->
    <el-dialog
      v-model="showDetailDialog"
      title="评论详情"
      width="500px"
      destroy-on-close
    >
      <div v-if="currentComment" class="comment-detail">
        <div class="detail-item">
          <label>评论内容：</label>
          <div class="content">{{ currentComment.content }}</div>
        </div>
        <div class="detail-item">
          <label>评论时间：</label>
          <div>{{ new Date(currentComment.creationTime).toLocaleString() }}</div>
        </div>
        <div class="detail-item">
          <label>可见性：</label>
          <div>{{ currentComment.isPublic ? '公开' : '私密' }}</div>
        </div>
        <div class="detail-item">
          <label>审核状态：</label>
          <div>
            <span v-if="currentComment.reviewStatus === 0" class="review-status">审核中</span>
            <span v-else-if="currentComment.reviewStatus === 1" class="review-status approved">已通过</span>
            <span v-else-if="currentComment.reviewStatus === 2" class="review-status rejected">已拒绝</span>
          </div>
        </div>
        <div class="detail-item">
          <label>点赞数：</label>
          <div>{{ currentComment.likeCount || 0 }}</div>
        </div>
        <div class="detail-item">
          <label>回复数：</label>
          <div>{{ currentComment.replyCount || 0 }}</div>
        </div>
        <div v-if="currentComment.parentCommentId" class="detail-item">
          <label>回复评论：</label>
          <div>#{{ currentComment.parentCommentId }}</div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
.section-header {
  margin-bottom: 16px;
}

:deep(.el-tabs__header) {
  margin-bottom: -10px;
  margin-top: -40px;
}

:deep(.el-tabs__nav-wrap.is-top) {
  padding: 12px 40px 0px 16px;
  width: 300px;
  margin: 0 auto;
}

:deep(.el-tabs__nav-wrap.is-top::after) {
  width: 160px;
  left: 10px;
}

:deep(.el-tabs__nav) {
  padding: 0;
}

:deep(.el-tabs__item) {
  padding: 0 20px;
  height: 40px;
  line-height: 40px;
}

:deep(.el-tabs__active-bar) {
  padding: 0;
}

:deep(.el-tabs__content) {
  overflow: visible;
  padding: 24px;
}

.comment-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.comment-items {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.comment-item {
  padding: 12px;
  border-radius: 4px;
  background: #f8f9fa;
  transition: all 0.3s;
}

.comment-item:hover {
  background: #f0f2f5;
}

.comment-content {
  font-size: 14px;
  color: #1a1a1a;
  margin-bottom: 8px;
}

.comment-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.comment-meta {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: #909399;
  flex-wrap: wrap;
}

.comment-visibility,
.review-status,
.reply-info {
  padding: 2px 6px;
  border-radius: 4px;
  font-size: 12px;
  background: #f0f2f5;
}

.review-status {
  background: #fdf6ec;
  color: #e6a23c;
}

.review-status.rejected {
  background: #fef0f0;
  color: #f56c6c;
}

.comment-stats {
  display: flex;
  align-items: center;
  gap: 8px;
}

.comment-stats span {
  display: flex;
  align-items: center;
  gap: 2px;
}

.no-comments {
  text-align: center;
  padding: 20px 0;
  color: #909399;
}

@media screen and (max-width: 768px) {
  .comment-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 8px;
  }

  .comment-meta {
    flex-direction: column;
    align-items: flex-start;
    gap: 4px;
  }

  .comment-actions {
    align-self: flex-end;
  }
}

.pagination {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

.comment-detail {
  padding: 16px;
}

.detail-item {
  margin-bottom: 16px;
  display: flex;
  gap: 8px;
}

.detail-item label {
  font-weight: 600;
  color: #606266;
  min-width: 80px;
}

.detail-item .content {
  white-space: pre-wrap;
  line-height: 1.5;
}

.review-status.approved {
  background: #f0f9eb;
  color: #67c23a;
}
</style> 