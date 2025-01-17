<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useUserStore } from '@/stores/user.js'
import Token from '@/stores/token.js'
import { ElMessage } from 'element-plus'
import {
  Menu as IconMenu,
  House,
  User,
  Document,
  ChatDotRound,
  Collection,
  Warning,
  ArrowRight,
  Expand,
  Fold,
  Check,
  Message
} from '@element-plus/icons-vue'

const router = useRouter()
const userStore = useUserStore()
const route = useRoute()

const isCollapse = ref(false)
const activeMenu = ref('')

const handleLogout = () => {
  Token.clearToken()
  userStore.clearUser()
  router.push('/admin/login')
}

const handleCommand = (command) => {
  if (command === 'logout') {
    handleLogout()
  }
}

const toggleCollapse = () => {
  isCollapse.value = !isCollapse.value
}

// 根据路由路径获取页面标题
const getPageTitle = computed(() => {
  const pathMap = {
    '/admin/dashboard': '统计信息',
    '/admin/users': '用户管理',
    '/admin/posts': '文章管理',
    '/admin/sections': '分区管理',
    '/admin/collections': '合集管理',
    '/admin/reviews': '审核管理',
    '/admin/reports': '举报管理',
    '/admin/feedbacks': '反馈管理',
    '/admin/settings': '系统设置',
    '/admin/comments': '评论管理'
  }
  return pathMap[route.path] || route.path
})

onMounted(() => {
  // 根据当前路由设置激活的菜单项
  const route = router.currentRoute.value
  activeMenu.value = route.name
})
</script>

<template>
  <div class="admin-layout">
    <!-- 侧边栏 -->
    <div class="sidebar" :class="{ 'is-collapse': isCollapse }">
      <div class="logo-container">
        <h1 v-show="!isCollapse">知识共享平台-管理系统</h1>
      </div>
      
      <el-menu
        :default-active="activeMenu"
        class="sidebar-menu"
        :collapse="isCollapse"
        @select="(index) => router.push({ name: index })"
      >
        <el-menu-item index="admin-dashboard">
          <el-icon><House /></el-icon>
          <template #title>统计信息</template>
        </el-menu-item>
        
        <el-menu-item index="admin-users">
          <el-icon><User /></el-icon>
          <template #title>用户管理</template>
        </el-menu-item>
        
        <el-menu-item index="admin-posts">
          <el-icon><Document /></el-icon>
          <template #title>帖子管理</template>
        </el-menu-item>
        
        <el-menu-item index="admin-comments">
          <el-icon><ChatDotRound /></el-icon>
          <template #title>评论管理</template>
        </el-menu-item>
        
        <el-menu-item index="admin-collections">
          <el-icon><Collection /></el-icon>
          <template #title>合集管理</template>
        </el-menu-item>
        <el-menu-item index="admin-feedbacks">
          <el-icon><ChatDotRound /></el-icon>
          <span>反馈管理</span>
        </el-menu-item>
        <el-menu-item index="admin-reviews">
          <el-icon><Check /></el-icon>
          <span>审核管理</span>
        </el-menu-item>
        <el-menu-item index="admin-reports">
          <el-icon><Warning /></el-icon>
          <template #title>举报管理</template>
        </el-menu-item>
        <!-- <el-menu-item index="admin-notifications">
          <el-icon><Message /></el-icon>
          <template #title>通知管理</template>
        </el-menu-item> -->
      </el-menu>
      
      <div class="sidebar-footer">
        <el-button
          :icon="isCollapse ? Expand : Fold"
          circle
          @click="toggleCollapse"
          class="collapse-btn"
        />
      </div>
    </div>
    
    <!-- 主要内容区域 -->
    <div class="main-content">
      <!-- 顶部导航栏 -->
      <div class="navbar">
        <div class="breadcrumb">
          <el-breadcrumb>
            <el-breadcrumb-item :to="{ path: '/admin/dashboard' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>{{ getPageTitle }}</el-breadcrumb-item>
          </el-breadcrumb>
        </div>
        
        <div class="user-info">
          <el-dropdown trigger="click" @command="handleCommand">
            <div class="user-dropdown">
              <el-avatar :size="32" :src="userStore.user?.avatar" />
              <span class="username">{{ userStore.user?.username }}</span>
            </div>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command="logout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </div>
      
      <!-- 路由视图 -->
      <div class="page-content">
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in">
            <component :is="Component" />
          </transition>
        </router-view>
      </div>
    </div>
  </div>
</template>

<style scoped>
.admin-layout {
  display: flex;
  min-height: 100vh;
  background-color: #f0f2f5;
}

.sidebar {
  width: 240px;
  background-color: #001529;
  color: #fff;
  transition: width 0.3s;
  display: flex;
  flex-direction: column;
}

.sidebar.is-collapse {
  width: 64px;
}

.logo-container {
  height: 60px;
  display: flex;
  align-items: center;
  padding: 0 16px;
  overflow: hidden;
  background-color: #002140;
}

.logo-container h1 {
  margin: 0;
  color: #fff;
  font-size: 18px;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
}

.sidebar-menu {
  flex: 1;
  border-right: none;
  background-color: #001529;
}

.sidebar-menu :deep(.el-menu) {
  background-color: transparent;
  border-right: none;
}

.sidebar-menu :deep(.el-menu-item) {
  height: 50px;
  line-height: 50px;
  color: rgba(255, 255, 255, 0.85);
}

.sidebar-menu :deep(.el-menu-item:hover) {
  background-color: #1890ff;
  color: #fff;
}

.sidebar-menu :deep(.el-menu-item.is-active) {
  background-color: #1890ff;
  color: #fff;
}

.sidebar-menu :deep(.el-menu-item .el-icon) {
  color: inherit;
}

.sidebar-footer {
  padding: 12px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  display: flex;
  justify-content: center;
}

.collapse-btn {
  background: transparent;
  border: none;
  color: #fff;
}

.collapse-btn:hover {
  background: rgba(255, 255, 255, 0.1);
}

.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.navbar {
  height: 60px;
  background: #fff;
  padding: 0 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
}

.breadcrumb {
  display: flex;
  align-items: center;
}

.user-info {
  display: flex;
  align-items: center;
}

.user-dropdown {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.user-dropdown:hover {
  background-color: #f5f5f5;
}

.username {
  font-size: 14px;
  color: #666;
}

.page-content {
  flex: 1;
  padding: 24px;
  overflow-y: auto;
}

/* 过渡动画 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

@media screen and (max-width: 768px) {
  .sidebar {
    position: fixed;
    height: 100vh;
    z-index: 1000;
    transform: translateX(0);
    transition: transform 0.3s;
  }
  
  .sidebar.is-collapse {
    transform: translateX(-100%);
  }
  
  .main-content {
    margin-left: 0;
  }
  
  .navbar {
    padding: 0 12px;
  }
  
  .page-content {
    padding: 12px;
  }
}
</style>