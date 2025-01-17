<script setup>
import Navbar from '@/components/Navbar.vue'
import { useUserStore } from '@/stores/user.js'
import { onMounted, onBeforeUnmount, getCurrentInstance, ref, computed } from 'vue'
import PersonalApi from '@/api/client/personal-api.js'
import Token from '@/stores/token.js'
import {
  Menu as IconMenu,
  House,
  Document,
  Collection,
  TrendCharts,
  User,
  ChatDotRound
} from '@element-plus/icons-vue'
import NotificationApi from '@/api/client/notification-api'

const userStore = useUserStore()
const unreadCount = ref(0)
const notifications = ref([])

// 获取未读通知数量
const getUnreadCount = async () => {
  console.log('开始获取未读通知数量')
  const token = Token.getToken()
  console.log('当前token:', token)
  if (token) {
    try {
      const userId = userStore.getUser().id
      console.log('当前用户ID:', userId)
      if (userId) {
        const count = await NotificationApi.getUnreadCount(userId)
        console.log('获取到未读通知数量:', count)
        unreadCount.value = count || 0
      }
    } catch (error) {
      console.error('获取未读通知数量失败:', error)
    }
  }
}

// 获取通知列表
const getNotifications = async () => {
  console.log('开始获取通知列表')
  const token = Token.getToken()
  if (token) {
    try {
      const userId = userStore.getUser().id
      console.log('当前用户ID:', userId)
      if (userId) {
        const response = await NotificationApi.getUserNotifications(userId, {
          current: 1,
          size: 10
        })
        console.log('获取到通知列表:', response)
        notifications.value = response || []
      }
    } catch (error) {
      console.error('获取通知列表失败:', error)
    }
  }
}

onMounted(async () => {
  console.log('BaseView 组件已挂载')
  // 如果有token，立即获取通知数量和列表
  if (Token.getToken()) {
    console.log('检测到 token，开始获取通知')
    try {
      const userInfo = await PersonalApi.getUserInfo()
      if (userInfo) {
        userStore.setUser(userInfo)
        // 获取用户信息后再获取通知
        await Promise.all([
          getUnreadCount(),
          getNotifications()
        ])
      }
    } catch (error) {
      console.error('获取用户信息失败:', error)
    }
  } else {
    console.log('未检测到 token，跳过获取通知')
  }
})

onBeforeUnmount(() => {
  // 清理全局实例
  const instance = getCurrentInstance()
  if (instance && instance.proxy) {
    instance.proxy.$el = null
  }
  window.$currentInstance = null
})

// 提供通知数据给子组件
const provideNotifications = computed(() => {
  return notifications.value
})
</script>

<template>
  <div class="base-view">
    <Navbar 
      :unread-count="unreadCount" 
      :notifications="notifications"
    />
    <div class="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<style scoped>
.base-view {
  min-height: 100vh;
  background-color: #f5f5f5;
}

.content {
  display: flex;
  justify-content: center;
  padding: 20px;
}
</style>