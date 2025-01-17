<script setup>
import {
  Message, Plus,
  Search, User, SwitchButton,
  ChatDotRound, Timer
} from '@element-plus/icons-vue'
import {useUserStore} from "@/stores/user.js";
import router from "@/router/index.js";
import Token from "@/stores/token.js";
import SearchApi from '@/api/client/search-api'
import { ref, onMounted } from 'vue'
import NotificationPopover from '@/components/NotificationPopover.vue'

const userStore = useUserStore()
const keyword = ref('')
const searchHistories = ref([])
const showSearchHistory = ref(false)

const props = defineProps({
  unreadCount: {
    type: Number,
    default: 0
  },
  notifications: {
    type: Array,
    default: () => []
  }
})

// 获取搜索历史
const getSearchHistory = async () => {
  try {
    console.log('获取搜索历史')
    const histories = await SearchApi.getSearchHistory()
    console.log('搜索历史:', histories)
    searchHistories.value = histories
  } catch (error) {
    console.error('获取搜索历史失败:', error)
    searchHistories.value = []
  }
}

// 处理搜索
const handleSearch = () => {
  const searchText = keyword.value.trim()
  if (!searchText) return
  
  showSearchHistory.value = false
  router.push({
    name: 'search',
    query: {
      keyword: searchText
    }
  })
}

// 点击搜索历史
const handleHistoryClick = (history) => {
  keyword.value = history
  handleSearch()
}

// 显示搜索历史
const showHistory = async () => {
  showSearchHistory.value = true
  await getSearchHistory()
}

// 隐藏搜索历史
const hideHistory = () => {
  setTimeout(() => {
    showSearchHistory.value = false
  }, 200)
}

onMounted(() => {
  getSearchHistory()
})

function logout() {
  Token.clearToken()
  userStore.clearUser()
  router.push('/login')
}

function goToPersonal() {
  router.push('/personal')
}
</script>

<template>
  <div class="navbar">
    <div class="logo">
      <img src="@/assets/images/logo.png" alt="logo" class="logo-image">
      <span class="logo-text">知识分享平台</span>
    </div>
    <div class="nav-list">
      <router-link class="nav-item" to="/home" active-class="active">首页</router-link>
      <router-link class="nav-item" to="/category" active-class="active">分区</router-link>
      <router-link class="nav-item" to="/rank" active-class="active">排行榜</router-link>
      <router-link class="nav-item" to="/ai" active-class="active">
        <!-- <el-icon class="nav-icon"><ChatDotRound /></el-icon> -->
        AI助手
      </router-link>
    </div>
    <div class="search">
      <div class="search-bar">
        <input 
          v-model="keyword"
          type="text" 
          placeholder="搜索内容..." 
          @keyup.enter="handleSearch"
          @focus="showHistory"
          @blur="hideHistory"
        />
        <el-icon class="search-icon" @click="handleSearch">
          <Search/>
        </el-icon>
        
        <!-- 搜索历史下拉框 -->
        <div v-show="showSearchHistory && searchHistories.length > 0" class="search-history">
          <div class="history-title">搜索历史</div>
          <div 
            v-for="(history, index) in searchHistories" 
            :key="index" 
            class="history-item"
            @click="handleHistoryClick(history)"
            @mousedown.prevent
          >
            <el-icon><Timer /></el-icon>
            <span>{{ history }}</span>
          </div>
        </div>
      </div>
      <router-link to="/post">
        <el-button type="primary" :icon="Plus" class="post-btn">
          发布
        </el-button>
      </router-link>
    </div>
    <div class="user-info">
      <template v-if="userStore.user">
        <NotificationPopover 
          :unread-count="unreadCount" 
          :initial-notifications="notifications"
        />
        <el-dropdown>
          <div class="avatar-and-username">
            <el-avatar class="avatar" :src="userStore.user.avatar"/>
            <el-text class="username">{{ userStore.user.username }}</el-text>
          </div>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="goToPersonal">
                <el-icon><User /></el-icon>
                个人中心
              </el-dropdown-item>
              <el-dropdown-item @click="logout" divided>
                <el-icon><SwitchButton /></el-icon>
                退出登录
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </template>
      <template v-else>
        <div class="login-info">
          <router-link to="/login" class="login" active-class="active">登录</router-link>
          |
          <router-link to="/register" class="register" active-class="active">注册</router-link>
        </div>
      </template>
    </div>
  </div>
</template>

<style scoped>
.navbar {
  width: 100%;
  height: 60px;
  display: flex;
  padding: 0 40px;
  box-sizing: border-box;
  z-index: 9999999;
  background-color: #fff;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
}

.logo {
  flex: 2;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 12px;
}

.logo-image {
  height: 36px;
  width: auto;
}

.logo-text {
  font-size: 20px;
  font-weight: bold;
  color: #000;
}

.nav-list {
  flex: 2;
  display: flex;
  justify-content: start;
  align-items: center;
  border: none;
}

.nav-item {
  margin: 0 20px;
  font-size: 16px;
  color: #666;
  height: 60px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: 600;
  text-decoration: none;
  position: relative;
  border: none;
  gap: 4px;
}

.nav-item.active {
  color: #000;
  border: none;
}

.nav-item.active::after {
  background: #1772f6;
  bottom: 0px;
  content: "";
  height: 3px;
  left: 0;
  position: absolute;
  right: 0;
  border: none;
}

.search {
  flex: 2;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}

.search-bar {
  position: relative;
  flex: 5;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 36px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  transition: all 0.3s;
}

.search-bar:focus-within {
  border-color: #409eff;
}

.search-bar input {
  width: 100%;
  height: 100%;
  background-color: transparent;
  border: 0;
  outline: 0;
  padding: 0 40px 0 15px;
  font-size: 14px;
  box-sizing: border-box;
}

.search-icon {
  position: absolute;
  right: 10px;
  cursor: pointer;
  padding: 5px;
  color: #606266;
}

.search-icon:hover {
  color: #409eff;
}

.search-history {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  background: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  margin-top: 5px;
  z-index: 1000;
}

.history-title {
  padding: 8px 12px;
  font-size: 13px;
  color: #909399;
  border-bottom: 1px solid #e4e7ed;
}

.history-item {
  padding: 8px 12px;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.history-item:hover {
  background-color: #f5f7fa;
}

.history-item .el-icon {
  font-size: 14px;
  color: #909399;
}

.history-item span {
  font-size: 14px;
  color: #606266;
}

.search .post-btn {
  flex: 1;
}

.user-info {
  height: 100%;
  display: flex;
  flex: 1;
  gap: 20px;
  justify-content: end;
  align-items: center;
}

.message {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.avatar-and-username {
  display: flex;
  gap: 10px;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.avatar-and-username:hover {
  background-color: #f5f7fa;
}

.login-info {
  display: flex;
  gap: 10px;
}

.login, .register {
  color: #666;
  text-decoration: none;
}

.login:hover, .register:hover {
  color: #000;
}

.login-info a.active {
  color: #000;
}

.nav-icon {
  font-size: 18px;
  display: flex;
  align-items: center;
}
</style>