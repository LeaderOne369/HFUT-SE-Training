<template>
  <div class="my-feedback">
    <div class="feedback-header">
      <h3>我的反馈</h3>
      <router-link to="/feedback" class="feedback-btn">
        <el-button type="primary" plain size="small">提交反馈</el-button>
      </router-link>
    </div>
    
    <div v-loading="loading" class="feedback-list">
      <template v-if="feedbackList.length">
        <div v-for="item in feedbackList" :key="item.id" class="feedback-item">
          <div class="feedback-meta">
            <span class="feedback-type">{{ parseFeedbackContent(item.feedbackContent).type }}</span>
            <span class="feedback-time">{{ formatTime(item.feedbackTime) }}</span>
          </div>
          <div class="feedback-title">{{ parseFeedbackContent(item.feedbackContent).title }}</div>
          <div class="feedback-content">{{ parseFeedbackContent(item.feedbackContent).content }}</div>
          <div class="feedback-contact">联系方式：{{ parseFeedbackContent(item.feedbackContent).contact }}</div>
          <div class="feedback-footer">
            <div class="feedback-status" :class="item.status">
              {{ getFeedbackStatus(item.status) }}
            </div>
            <el-button 
              type="danger" 
              size="small" 
              plain
              :icon="Delete"
              @click="handleDelete(item.id)"
            >
              删除
            </el-button>
          </div>
        </div>
      </template>
      <el-empty v-else description="暂无反馈记录" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { formatTime } from '@/utils/time'
import feedbackApi from '@/api/client/feedback-api'
import { useUserStore } from '@/stores/user'
import { ElMessageBox, ElMessage } from 'element-plus'
import { Delete } from '@element-plus/icons-vue'

const userStore = useUserStore()
const loading = ref(false)
const feedbackList = ref([])

// 解析反馈内容
const parseFeedbackContent = (content) => {
  if (!content) return { type: '未知', title: '', content: '', contact: '未提供' }
  
  const lines = content.split('\n')
  const result = {
    type: '',
    title: '',
    content: '',
    contact: '未提供'
  }
  
  lines.forEach(line => {
    if (line.startsWith('类型：')) {
      const type = line.replace('类型：', '').trim()
      result.type = getFeedbackType(type)
    } else if (line.startsWith('标题：')) {
      result.title = line.replace('标题：', '').trim()
    } else if (line.startsWith('内容：')) {
      result.content = line.replace('内容：', '').trim()
    } else if (line.startsWith('联系方式：')) {
      result.contact = line.replace('联系方式：', '').trim()
    }
  })
  
  return result
}

// 获取反馈类型显示文本
const getFeedbackType = (type) => {
  const typeMap = {
    feature: '功能建议',
    bug: '问题反馈',
    content: '内容建议',
    other: '其他'
  }
  return typeMap[type] || '未知类型'
}

// 获取反馈状态显示文本
const getFeedbackStatus = (status) => {
  const statusMap = {
    0: '待处理',
    1: '处理中',
    2: '已完成',
    3: '已关闭'
  }
  return statusMap[status] || '未知状态'
}

// 删除反馈
const handleDelete = async (id) => {
  try {
    await ElMessageBox.confirm(
      '确定要删除这条反馈吗？',
      '提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
    )
    
    await feedbackApi.deleteFeedback(id)
    ElMessage.success('删除成功')
    loadFeedbackList() // 重新加载列表
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除反馈失败:', error)
      ElMessage.error('删除失败')
    }
  }
}

// 加载反馈列表
const loadFeedbackList = async () => {
  loading.value = true
  try {
    const userId = userStore.user?.id
    if (!userId) {
      console.error('未找到用户ID')
      return
    }
    const response = await feedbackApi.getFeedbackList(userId)
    feedbackList.value = response || []
  } catch (error) {
    console.error('获取反馈列表失败:', error)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  loadFeedbackList()
})
</script>

<style scoped>
.my-feedback {
  background-color: #fff;
  border-radius: 8px;
  padding: 24px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.feedback-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.feedback-header h3 {
  margin: 0;
  font-size: 18px;
  color: #303133;
}

.feedback-list {
  min-height: 200px;
}

.feedback-item {
  padding: 20px;
  border-radius: 8px;
  background-color: #f8f9fa;
  margin-bottom: 16px;
  transition: all 0.3s;
}

.feedback-item:hover {
  background-color: #f0f2f5;
}

.feedback-item:last-child {
  margin-bottom: 0;
}

.feedback-meta {
  display: flex;
  justify-content: space-between;
  margin-bottom: 12px;
  font-size: 13px;
}

.feedback-type {
  color: #409eff;
  background-color: #ecf5ff;
  padding: 2px 8px;
  border-radius: 4px;
}

.feedback-time {
  color: #909399;
}

.feedback-title {
  font-size: 16px;
  color: #303133;
  margin-bottom: 12px;
  font-weight: 500;
}

.feedback-content {
  font-size: 14px;
  color: #606266;
  margin-bottom: 12px;
  line-height: 1.6;
  padding: 12px;
  background-color: #fff;
  border-radius: 4px;
}

.feedback-contact {
  font-size: 13px;
  color: #909399;
  margin-bottom: 12px;
}

.feedback-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.feedback-status {
  font-size: 13px;
  padding: 4px 12px;
  border-radius: 4px;
  display: inline-block;
}

.feedback-status[class="0"] {
  color: #e6a23c;
  background-color: #fdf6ec;
}

.feedback-status[class="1"] {
  color: #409eff;
  background-color: #ecf5ff;
}

.feedback-status[class="2"] {
  color: #67c23a;
  background-color: #f0f9eb;
}

.feedback-status[class="3"] {
  color: #909399;
  background-color: #f4f4f5;
}
</style> 