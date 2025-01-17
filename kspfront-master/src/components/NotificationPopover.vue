<template>
  <el-popover
    placement="bottom"
    :width="300"
    trigger="click"
    popper-class="notification-popover"
  >
    <template #reference>
      <el-badge :value="localUnreadCount" :max="99" :hidden="!localUnreadCount" class="notification-badge">
        <el-button class="notification-btn" :icon="Bell" circle />
      </el-badge>
    </template>

    <div class="notification-container">
      <div class="notification-header">
        <h3>通知</h3>
        <el-button 
          v-if="notifications.length && hasUnread" 
          type="primary" 
          link 
          @click="handleMarkAllRead"
        >
          全部标记为已读
        </el-button>
      </div>

      <div class="notification-content" v-loading="loading">
        <template v-if="notifications.length">
          <div
            v-for="notification in notifications"
            :key="notification.id"
            class="notification-item"
            @click="handleNotificationClick(notification)"
          >
            <div class="notification-content">
              <div class="notification-title">
                {{ notification.title }}
                <span v-if="notification.status !== 1" class="unread-dot"></span>
              </div>
              <div class="notification-message">{{ notification.content }}</div>
              <div class="notification-time">{{ formatTime(notification.creationTime) }}</div>
            </div>
          </div>
        </template>
        <el-empty v-else description="暂无通知" />
      </div>

      <div class="notification-footer" v-if="total > 0">
        <el-pagination
          v-model:current-page="currentPage"
          :page-size="pageSize"
          :total="total"
          @current-change="handleCurrentChange"
          layout="prev, pager, next"
          background
        />
      </div>
    </div>
  </el-popover>

  <!-- 通知详情对话框 -->
  <el-dialog
    v-model="dialogVisible"
    title="通知详情"
    width="500px"
    :close-on-click-modal="false"
    class="notification-detail-dialog"
  >
    <div v-loading="detailLoading" class="notification-detail">
      <template v-if="currentNotification">
        <div class="notification-detail-header">
          <h3 class="notification-detail-title">{{ currentNotification.title }}</h3>
        </div>
        <div class="notification-detail-meta">
          <div class="meta-row">
            <div class="meta-item">
              <span class="meta-label">发件人</span>
              <span class="meta-value">{{ currentNotification.senderName || '加载中...' }}</span>
            </div>
            <div class="meta-item">
              <span class="meta-label">发送时间</span>
              <span class="meta-value">{{ formatDetailTime(currentNotification.creationTime) }}</span>
            </div>
          </div>
        </div>
        <div class="notification-detail-content">
          {{ currentNotification.content }}
        </div>
      </template>
    </div>
  </el-dialog>
</template>

<script setup>
import { ref, onMounted, watch, computed } from 'vue'
import Token from '@/stores/token'
import NotificationApi from '@/api/client/notification-api'
import UserApi from '@/api/client/user-api'
import { ElMessage } from 'element-plus'
import { Bell } from '@element-plus/icons-vue'
import { formatTime, formatDetailTime } from '@/utils/format'

const props = defineProps({
  unreadCount: {
    type: Number,
    default: 0
  },
  initialNotifications: {
    type: Array,
    default: () => []
  }
})

const notifications = ref(props.initialNotifications)
const loading = ref(false)
const total = ref(props.initialNotifications.length)
const currentPage = ref(1)
const pageSize = ref(10)
const localUnreadCount = ref(props.unreadCount)
const dialogVisible = ref(false)
const detailLoading = ref(false)
const currentNotification = ref(null)

// 计算是否有未读通知
const hasUnread = computed(() => {
  return notifications.value.some(notification => notification.status !== 1)
})

// 监听外部传入的通知列表变化
watch(() => props.initialNotifications, (newVal) => {
  notifications.value = newVal
  total.value = newVal.length
}, { deep: true })

// 监听外部传入的未读数量变化
watch(() => props.unreadCount, (newVal) => {
  console.log('未读数量变化:', newVal)
  localUnreadCount.value = newVal
}, { immediate: true })

// 获取通知列表
const fetchNotifications = async () => {
  const userId = Token.getUserId()
  if (!userId) return
  
  loading.value = true
  try {
    const response = await NotificationApi.getUserNotifications(userId, {
      current: currentPage.value,
      size: pageSize.value
    })
    console.log('获取通知列表响应:', response)
    notifications.value = response || []
    total.value = response?.length || 0
  } catch (error) {
    console.error('获取通知失败:', error)
    ElMessage.error('获取通知失败')
  } finally {
    loading.value = false
  }
}

// 获取通知详情
const fetchNotificationDetail = async (id) => {
  detailLoading.value = true
  try {
    const detail = await NotificationApi.getNotificationDetail(id)
    currentNotification.value = detail
  } catch (error) {
    console.error('获取通知详情失败:', error)
    ElMessage.error('获取通知详情失败')
  } finally {
    detailLoading.value = false
  }
}

// 标记单条通知为已读
const markNotificationAsRead = async (notification) => {
  if (notification.status === 1) return
  
  try {
    await NotificationApi.markAsRead(notification.id)
    notification.status = 1
    localUnreadCount.value = Math.max(0, localUnreadCount.value - 1)
  } catch (error) {
    console.error('标记通知已读失败:', error)
    ElMessage.error('标记通知已读失败')
  }
}

// 标记所有通知为已读
const handleMarkAllRead = async () => {
  const userId = Token.getUserId()
  if (!userId) return
  
  try {
    await NotificationApi.markAllAsRead(userId)
    notifications.value.forEach(notification => {
      notification.status = 1
    })
    localUnreadCount.value = 0
    ElMessage.success('已全部标记为已读')
  } catch (error) {
    console.error('标记全部已读失败:', error)
    ElMessage.error('标记全部已读失败')
  }
}

// 获取发件人信息
const getSenderName = async (senderId) => {
  if (!senderId) return '系统'
  try {
    const userInfo = await UserApi.getUserInfo(senderId)
    return userInfo.username || '未知用户'
  } catch (error) {
    console.error('获取发件人信息失败:', error)
    return '未知用户'
  }
}

// 处理通知点击
const handleNotificationClick = async (notification) => {
  // 先标记为已读
  await markNotificationAsRead(notification)
  // 显示详情
  currentNotification.value = notification
  dialogVisible.value = true
  // 获取完整详情
  await fetchNotificationDetail(notification.id)
  // 获取发件人信息
  if (currentNotification.value) {
    currentNotification.value.senderName = await getSenderName(currentNotification.value.userSenderId)
  }
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  fetchNotifications()
}

// 组件挂载时获取通知
onMounted(() => {
  fetchNotifications()
})
</script>

<style scoped>
.notification-badge {
  margin-right: 16px;
}

.notification-btn {
  padding: 8px;
}

.notification-container {
  max-height: 400px;
  display: flex;
  flex-direction: column;
}

.notification-header {
  padding: 12px 16px;
  border-bottom: 1px solid #ebeef5;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.notification-header h3 {
  margin: 0;
  font-size: 16px;
  color: #303133;
}

.notification-content {
  flex: 1;
  overflow-y: auto;
  /* padding: 8px 0; */
  min-height: 20px;
}

.notification-item {
  padding: 12px 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.notification-item:hover {
  background-color: #f5f7fa;
}

.notification-content {
  position: relative;
}

.unread-dot {
  position: absolute;
  top: 20%;
  right: 0px;
  transform: translateY(-50%);
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background-color: #f56c6c;
}

.notification-title {
  font-size: 14px;
  color: #303133;
  margin-bottom: 4px;
  position: relative;
  /* padding-right: 16px; */
}

.notification-message {
  font-size: 12px;
  color: #606266;
  margin-bottom: 4px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.notification-time {
  font-size: 12px;
  color: #909399;
}

.notification-footer {
  padding: 12px 16px;
  border-top: 1px solid #ebeef5;
  display: flex;
  justify-content: center;
}

.notification-detail-content {
  margin: 16px 0;
  font-size: 14px;
  color: #606266;
  line-height: 1.6;
}

.notification-detail-time {
  font-size: 12px;
  color: #909399;
  text-align: right;
}

:deep(.el-pagination.is-background .el-pager li:not(.is-disabled).is-active) {
  background-color: var(--el-color-primary);
}

/* 通知详情样式 */
.notification-detail {
  padding: 0 24px;
}

.notification-detail-header {
  margin-bottom: 24px;
  padding-bottom: 16px;
  border-bottom: 1px solid #ebeef5;
}

.notification-detail-title {
  margin: 0;
  font-size: 20px;
  font-weight: 600;
  color: #303133;
  line-height: 1.4;
}

.notification-detail-meta {
  padding: 16px 24px;
  background-color: #f7f8fa;
  border-radius: 8px;
  margin-bottom: 24px;
}

.meta-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.meta-item {
  display: flex;
  align-items: center;
  font-size: 14px;
}

.meta-label {
  color: #909399;
  margin-right: 12px;
  min-width: 56px;
  text-align: right;
}

.meta-value {
  color: #606266;
  font-weight: 500;
}

.notification-detail-content {
  font-size: 15px;
  line-height: 1.8;
  color: #606266;
  margin: 24px 0;
  padding: 0 8px;
  white-space: pre-wrap;
  word-break: break-all;
}

:deep(.el-dialog__header) {
  margin-right: 0;
  padding: 24px;
  border-bottom: 1px solid #ebeef5;
}

:deep(.el-dialog__headerbtn) {
  top: 24px;
  right: 24px;
}

:deep(.el-dialog__body) {
  padding: 24px 0;
}

:deep(.el-dialog__title) {
  font-size: 18px;
  font-weight: 600;
}
</style> 