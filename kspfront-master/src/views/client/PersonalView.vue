<script setup>
import { ref, onMounted, onBeforeUnmount, onUnmounted, nextTick, getCurrentInstance } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import PersonalApi from '@/api/client/personal-api.js'
import { useRouter } from 'vue-router'
import Token from '@/stores/token.js'
import PersonalPostApi from '@/api/client/personal-post-api.js'
import { Delete, Edit, Plus, Folder, Document, Collection, Picture, Star, Setting, ChatDotRound, User } from '@element-plus/icons-vue'
import FavoriteApi from '@/api/client/favorite-api.js'
import { useUserStore } from '@/stores/user.js'
import FavoriteManager from '@/components/personal/FavoriteManager.vue'
import CollectionManager from '@/components/personal/CollectionManager.vue'
import CommentManager from '@/components/personal/CommentManager.vue'
import MyFeedback from '@/components/MyFeedback.vue'

const router = useRouter()
const userStore = useUserStore()
const loading = ref(false)
const userInfo = ref({
  username: '',
  email: '',
  phoneNumber: '',
  registrationTime: '',
  lastLoginTime: '',
  lastLoginLocation: '',
  gender: null,
  birthDate: null,
  bio: '',
  avatar: null,
  followingCount: 0,
  followersCount: 0
})

// 编辑表单
const editForm = ref({
  username: '',
  email: '',
  phoneNumber: '',
  gender: null,
  birthDate: null,
  bio: ''
})

const isEditing = ref(false)

// 帖子列表
const posts = ref([])
const postsLoading = ref(false)
const postTotal = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

// 添加当前选中的导航项
const currentNav = ref('posts') // 'posts' | 'favorites' | 'collections' | 'settings' | 'feedback'

// 获取用户信息
const getUserInfo = async () => {
  loading.value = true
  try {
    const data = await PersonalApi.getUserInfo()
    if (data) {
      userInfo.value = data
      editForm.value = {
        username: data.username,
        email: data.email,
        phoneNumber: data.phoneNumber || '',
        gender: data.gender,
        birthDate: data.birthDate,
        bio: data.bio || ''
      }
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
    ElMessage.error('获取用户信息失败')
  } finally {
    loading.value = false
  }
}

// 上传头像
const handleAvatarUpload = async (file) => {
  if (!file) return
  
  const isImage = file.type.startsWith('image/')
  if (!isImage) {
    ElMessage.error('请上传图片文件')
    return
  }

  const isLt2M = file.size / 1024 / 1024 < 2
  if (!isLt2M) {
    ElMessage.error('图片大小不能超过 2MB')
    return
  }

  const formData = new FormData()
  formData.append('file', file)

  try {
    const data = await PersonalApi.uploadAvatar(formData)
    if (data) {
      userInfo.value.avatar = data.avatar
      // 更新 userStore 中的用户信息
      const updatedUserInfo = await PersonalApi.getUserInfo()
      userStore.setUser(updatedUserInfo)
      ElMessage.success('头像上传成功')
      // 刷新页面
      window.location.reload()
    }
  } catch (error) {
    console.error('头像上传失败:', error)
    ElMessage.error('头像上传失败')
  }
}

// 更新用户信息
const handleUpdateInfo = async () => {
  try {
    await PersonalApi.updateUserInfo(editForm.value)
    ElMessage.success('信息更新成功')
    isEditing.value = false
    getUserInfo()
  } catch (error) {
    console.error('更新用户信息失败:', error)
    ElMessage.error('更新用户信息失败')
  }
}

// 取消编辑
const handleCancelEdit = () => {
  isEditing.value = false
  editForm.value = {
    username: userInfo.value.username,
    email: userInfo.value.email,
    phoneNumber: userInfo.value.phoneNumber || '',
    gender: userInfo.value.gender,
    birthDate: userInfo.value.birthDate,
    bio: userInfo.value.bio || ''
  }
}

// 注销账号
const handleDeactivate = async () => {
  try {
    await ElMessageBox.confirm(
      '注销账号后，所有数据将无法恢复。确定要注销账号吗？',
      '警告',
      {
        confirmButtonText: '确定注销',
        cancelButtonText: '取消',
        type: 'warning'
      }
    )
    
    await PersonalApi.deactivateAccount()
    ElMessage.success('账号已注销')
    Token.clearToken()
    router.push('/login')
  } catch (error) {
    if (error !== 'cancel') {
      console.error('注销账号失败:', error)
      ElMessage.error('注销账号失败')
    }
  }
}

// 获取帖子列表
const getPostList = async () => {
  postsLoading.value = true
  try {
    const data = await PersonalPostApi.getPostList()
    if (data) {
      posts.value = data.records || []
      postTotal.value = data.total || 0
    }
  } catch (error) {
    console.error('获取帖子列表失败:', error)
    ElMessage.error('获取帖子列表失败')
  } finally {
    postsLoading.value = false
  }
}

// 删除帖子
const handleDeletePost = async (postId) => {
  try {
    await ElMessageBox.confirm(
      '确定要删除这篇帖子吗？',
      '警告',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
    )
    
    await PersonalPostApi.deletePost(postId)
    ElMessage.success('删除成功')
    getPostList()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除帖子失败:', error)
      ElMessage.error('删除帖子失败')
    }
  }
}

// 编辑帖子
const handleEditPost = (postId) => {
  router.push(`/post?id=${postId}`)
}

// 写新文章
const handleNewPost = () => {
  router.push('/post')
}

// 修改组件卸载前的清理
onBeforeUnmount(() => {
  userInfo.value = {
    username: '',
    email: '',
    phoneNumber: '',
    registrationTime: '',
    lastLoginTime: '',
    lastLoginLocation: '',
    gender: null,
    birthDate: null,
    bio: '',
    avatar: null,
    followingCount: 0,
    followersCount: 0
  }
  editForm.value = {
    username: '',
    email: '',
    phoneNumber: '',
    gender: null,
    birthDate: null,
    bio: ''
  }
  isEditing.value = false
  posts.value = []
  currentNav.value = 'posts'

  // 重置所有加载状态
  loading.value = false
  postsLoading.value = false

  // 清理全局实例
  const instance = getCurrentInstance()
  if (instance && instance.proxy) {
    instance.proxy.$el = null
  }
  window.$currentInstance = null
})

onMounted(() => {
  getUserInfo()
  getPostList()
})
</script>

<template>
  <div class="personal-view">
    <!-- 顶部个人信息卡片 -->
    <div class="top-section">
      <div class="user-info">
        <div class="avatar-section">
          <el-upload
            class="avatar-uploader"
            :show-file-list="false"
            :auto-upload="false"
            :on-change="file => handleAvatarUpload(file.raw)"
          >
            <div class="avatar-wrapper">
              <img
                v-if="userInfo.avatar"
                :src="userInfo.avatar"
                class="avatar"
                alt="用户头像"
              />
            </div>
          </el-upload>
        </div>
        <div class="basic-info">
          <h2 class="username">{{ userInfo.username }}</h2>
          <div class="user-meta">
            <span>IP 地址：{{ userInfo.lastLoginLocation }}</span>
            <span>注册时间：{{ new Date(userInfo.registrationTime).toLocaleString() }}</span>
          </div>
        </div>
        <div class="user-stats">
          <div class="stat-item">
            <div class="stat-value">{{ userInfo.followingCount }}</div>
            <div class="stat-label">关注</div>
          </div>
          <div class="stat-item">
            <div class="stat-value">{{ userInfo.followersCount }}</div>
            <div class="stat-label">粉丝</div>
          </div>
          <div class="stat-item">
            <div class="stat-value">{{ posts.length }}</div>
            <div class="stat-label">文章</div>
          </div>
        </div>
      </div>
    </div>

    <!-- 主要内容区域 -->
    <div class="main-content">
      <el-tabs v-model="currentNav" class="nav-tabs">
        <el-tab-pane name="posts" label="我的帖子">
          <div class="content-section">
            <div class="section-header">
              <h3>文章管理</h3>
              <el-button type="primary" :icon="Plus" @click="handleNewPost">写文章</el-button>
            </div>
            <div class="post-list" v-loading="postsLoading">
              <div v-if="posts.length > 0" class="post-items">
                <div v-for="post in posts" :key="post.id" class="post-item">
                  <div class="post-info">
                    <h4 class="post-title">{{ post.title }}</h4>
                    <p class="post-summary">{{ post.summary }}</p>
                    <div class="post-meta">
                      <span>{{ new Date(post.createTime).toLocaleString() }}</span>
                      <span>{{ post.viewCount }} 浏览</span>
                      <span>{{ post.likeCount }} 点赞</span>
                      <span>{{ post.commentCount }} 评论</span>
                    </div>
                  </div>
                  <div class="post-actions">
                    <el-button 
                      type="primary" 
                      :icon="Edit" 
                      circle 
                      @click="handleEditPost(post.id)"
                    />
                    <el-button 
                      type="danger" 
                      :icon="Delete" 
                      circle 
                      @click="handleDeletePost(post.id)"
                    />
                  </div>
                </div>
              </div>
              <div v-else class="no-posts">
                <el-empty description="还没有发布过文章~">
                  <router-link to="/post">
                    <el-button type="primary">写文章</el-button>
                  </router-link>
                </el-empty>
              </div>
            </div>
          </div>
        </el-tab-pane>

        <el-tab-pane name="favorites" label="我的收藏">
          <favorite-manager />
        </el-tab-pane>

        <el-tab-pane name="collections" label="我的合集">
          <collection-manager />
        </el-tab-pane>

        <el-tab-pane name="comments" label="我的评论">
          <comment-manager />
        </el-tab-pane>

        <el-tab-pane name="feedback" label="我的反馈">
          <my-feedback />
        </el-tab-pane>

        <el-tab-pane name="settings" label="个人设置">
          <div class="content-section">
            <div class="section-header">
              <h3>账号设置</h3>
            </div>
            <el-form :model="editForm" label-width="80px">
              <el-form-item label="用户名">
                <el-input v-model="editForm.username" />
              </el-form-item>
              <el-form-item label="邮箱">
                <el-input v-model="editForm.email" />
              </el-form-item>
              <el-form-item label="手机号">
                <el-input v-model="editForm.phoneNumber" />
              </el-form-item>
              <el-form-item label="性别">
                <el-radio-group v-model="editForm.gender">
                  <el-radio :label="1">男</el-radio>
                  <el-radio :label="2">女</el-radio>
                  <el-radio :label="0">保密</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="生日">
                <el-date-picker
                  v-model="editForm.birthDate"
                  type="date"
                  placeholder="选择日期"
                />
              </el-form-item>
              <el-form-item label="个人简介">
                <el-input
                  v-model="editForm.bio"
                  type="textarea"
                  :rows="3"
                  placeholder="写点什么介绍一下自己吧~"
                />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="handleUpdateInfo">保存</el-button>
                <el-button type="danger" @click="handleDeactivate">注销账号</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<style scoped>
.personal-view {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  min-height: calc(100vh - 60px);
  background: #f5f7fa;
}

.top-section {
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  margin-bottom: 20px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.user-info {
  display: flex;
  align-items: center;
  gap: 24px;
}

.avatar-section {
  flex-shrink: 0;
}

.avatar-wrapper {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  background: #f5f5f5;
  display: flex;
  align-items: center;
  justify-content: center;
}

.avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.basic-info {
  flex: 1;
}

.username {
  font-size: 24px;
  font-weight: 600;
  color: #1a1a1a;
  margin: 0 0 8px;
}

.user-meta {
  display: flex;
  gap: 16px;
  color: #909399;
  font-size: 14px;
}

.user-stats {
  display: flex;
  gap: 40px;
  margin-left: auto;
}

.stat-item {
  text-align: center;
}

.stat-value {
  font-size: 24px;
  font-weight: 600;
  color: #1a1a1a;
}

.stat-label {
  font-size: 14px;
  color: #909399;
  margin-top: 4px;
}

.main-content {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.section-header h3 {
  font-size: 18px;
  font-weight: 600;
  color: #1a1a1a;
  margin: 0;
}

.post-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.post-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px;
  border-radius: 8px;
  background: #f8f9fa;
  transition: all 0.3s;
}

.post-item:hover {
  background: #f0f2f5;
}

.post-info {
  flex: 1;
  margin-right: 16px;
}

.post-title {
  font-size: 16px;
  font-weight: 600;
  color: #1a1a1a;
  margin: 0 0 8px;
}

.post-summary {
  font-size: 14px;
  color: #606266;
  margin: 0 0 8px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.post-meta {
  display: flex;
  gap: 16px;
  font-size: 12px;
  color: #909399;
}

.post-actions {
  display: flex;
  gap: 8px;
}

.no-posts {
  padding: 40px 0;
  text-align: center;
}

/* 添加收藏管理相关样式 */
:deep(.el-tabs__content) {
  padding: 24px;
}

:deep(.el-tabs__nav-wrap) {
  padding: 0 24px;
}

:deep(.el-tab-pane) {
  /* min-height: 500px; */
  min-height: unset;
}

/* 响应式布局 */
@media screen and (max-width: 768px) {
  .personal-view {
    padding: 12px;
  }

  .user-info {
    flex-direction: column;
    text-align: center;
  }

  .user-stats {
    margin: 20px 0 0;
    justify-content: center;
  }

  .main-content {
    flex-direction: column;
  }

  .post-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }

  .post-info {
    margin-right: 0;
  }

  .post-actions {
    align-self: flex-end;
  }

  .post-meta {
    flex-wrap: wrap;
    gap: 8px;
  }

  .main-content {
    border-radius: 8px;
  }

  :deep(.el-tabs__content) {
    padding: 16px;
  }

  :deep(.el-tabs__nav-wrap) {
    padding: 0 16px;
  }
}
</style> 