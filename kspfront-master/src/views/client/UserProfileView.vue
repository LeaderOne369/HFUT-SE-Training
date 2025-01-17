<template>
  <div class="user-profile">
    <div class="profile-layout">
      <!-- 左侧用户信息区域 -->
      <div class="profile-left">
        <div class="profile-header" v-if="userInfo">
          <div class="profile-cover"></div>
          <div class="profile-info">
            <el-avatar 
              :size="100" 
              :src="userInfo.avatar || '/images/default-avatar.png'"
              class="profile-avatar"
            />
            <div class="profile-details">
              <div class="profile-top">
                <h1 class="profile-name">{{ userInfo.username }}</h1>
                <div class="profile-actions">
                  <el-button 
                    v-if="userStore.user && userStore.user.id !== parseInt(route.params.id)"
                    :type="userInfo.isFollowed ? 'primary' : 'default'"
                    @click="handleFollow"
                    :loading="followLoading"
                  >
                    {{ userInfo.isFollowed ? '已关注' : '关注' }}
                  </el-button>
                  <el-button 
                    v-if="userStore.user && userStore.user.id !== parseInt(route.params.id)"
                    type="danger" 
                    @click="showReportDialog = true" 
                    :icon="Warning"
                  >
                    举报
                  </el-button>
                </div>
              </div>
              <div class="profile-meta">
                <span class="join-date">加入于 {{ formatDate(userInfo.registrationTime) }}</span>
                <span v-if="userInfo.lastLoginTime" class="last-login">
                  最后登录: {{ formatDate(userInfo.lastLoginTime) }}
                </span>
              </div>
              <div class="profile-bio" v-if="userInfo.bio">{{ userInfo.bio }}</div>
              <div class="profile-stats">
                <div class="stat-item clickable" @click="showFollowingDialog = true">
                  <strong>{{ userInfo.followingCount || 0 }}</strong>
                  <span>关注</span>
                </div>
                <div class="stat-item clickable" @click="showFollowersDialog = true">
                  <strong>{{ userInfo.followersCount || 0 }}</strong>
                  <span>粉丝</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 添加 logo -->
        <div class="profile-logo">
          <img src="@/assets/images/logo.png" alt="logo" class="logo-image">
          <div class="copyright-info">
            <p class="copyright-text">© 2024 知识分享平台</p>
            <p class="copyright-text">All Rights Reserved Version 1.0.0</p>
           
          </div>
        </div>
      </div>

      <!-- 右侧帖子列表区域 -->
      <div class="profile-right">
        <div class="posts-section" v-loading="postsLoading">
          <h2 class="section-title">发布的帖子</h2>
          <div class="posts-list">
            <template v-if="posts.length > 0">
              <div v-for="post in posts" :key="post.id" class="post-item" @click="viewPost(post.id)">
                <div class="post-main">
                  <div class="post-header">
                    <h3 class="post-title">{{ post.title }}</h3>
                    <div class="post-tags">
                      <el-tag 
                        v-for="tag in post.tags?.split(',')" 
                        :key="tag" 
                        size="small" 
                        class="post-tag"
                      >
                        {{ tag.trim() }}
                      </el-tag>
                    </div>
                  </div>
                  <p class="post-content">{{ post.summary }}</p>
                  <div class="post-meta">
                    <span class="post-time">{{ formatDate(post.publishTime) }}</span>
                    <div class="post-stats">
                      <span class="stat">
                        <el-icon><View /></el-icon>
                        {{ post.viewCount || 0 }}
                      </span>
                      <span class="stat">
                        <el-icon><ChatRound /></el-icon>
                        {{ post.commentCount || 0 }}
                      </span>
                      <span class="stat">
                        <el-icon><Star /></el-icon>
                        {{ post.likeCount || 0 }}
                      </span>
                    </div>
                  </div>
                </div>
                <div class="post-cover" v-if="post.cover">
                  <img :src="post.cover" :alt="post.title">
                </div>
              </div>
            </template>
            <el-empty v-else description="暂无帖子" />
          </div>
        </div>
      </div>
    </div>

    <!-- 关注者对话框 -->
    <el-dialog
      v-model="showFollowersDialog"
      title="粉丝列表"
      width="500px"
    >
      <div class="followers-list" v-loading="followLoading">
        <template v-if="followers.length > 0">
          <div v-for="follower in followers" :key="follower.id" class="follower-item">
            <el-avatar :size="40" :src="follower.avatar || '/images/default-avatar.png'" />
            <div class="follower-info">
              <div class="follower-name">{{ follower.username }}</div>
              <div class="follower-bio">{{ follower.bio || '这个人很懒，什么都没写~' }}</div>
            </div>
          </div>
        </template>
        <el-empty v-else description="暂无粉丝" />
      </div>
    </el-dialog>

    <!-- 关注列表对话框 -->
    <el-dialog
      v-model="showFollowingDialog"
      title="关注列表"
      width="500px"
    >
      <div class="following-list" v-loading="followLoading">
        <template v-if="following.length > 0">
          <div v-for="follow in following" :key="follow.id" class="follower-item">
            <el-avatar :size="40" :src="follow.avatar || '/images/default-avatar.png'" />
            <div class="follower-info">
              <div class="follower-name">{{ follow.username }}</div>
              <div class="follower-bio">{{ follow.bio || '这个人很懒，什么都没写~' }}</div>
            </div>
          </div>
        </template>
        <el-empty v-else description="暂无关注" />
      </div>
    </el-dialog>

    <!-- 举报对话框 -->
    <el-dialog
      v-model="showReportDialog"
      title="举报用户"
      width="500px"
    >
      <div class="report-dialog-content">
        <el-form :model="reportForm" label-width="80px">
          <el-form-item label="举报类型" required>
            <el-select v-model="reportForm.typeId" placeholder="请选择举报类型">
              <el-option
                v-for="type in reportTypes"
                :key="type.id"
                :label="type.name"
                :value="type.id"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="举报理由">
            <el-input
              v-model="reportForm.reason"
              type="textarea"
              :rows="4"
              placeholder="请输入举报理由（选填）"
            />
          </el-form-item>
        </el-form>
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showReportDialog = false">取消</el-button>
          <el-button type="primary" @click="submitReport" :loading="reportLoading">
            提交举报
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { Warning, View, ChatRound, Star } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'
import UserProfileApi from '@/api/client/user-profile-api'
import request from '@/utils/request.js'
import { useUserStore } from '@/stores/user'

const route = useRoute()
const router = useRouter()
const userStore = useUserStore()

// 用户基本信息
const userInfo = ref(null)

// 关注相关
const showFollowersDialog = ref(false)
const showFollowingDialog = ref(false)
const followLoading = ref(false)
const followers = ref([])
const following = ref([])

// 举报相关
const showReportDialog = ref(false)
const reportLoading = ref(false)
const reportTypes = ref([])
const reportForm = ref({
  typeId: null,
  reason: ''
})

// 帖子相关
const posts = ref([])
const postsLoading = ref(false)

// 检查关注状态
const checkFollowStatus = async (userId) => {
  try {
    const response = await request.get(`/api/system/follow/check/${userId}`)
    if (response) {
      userInfo.value.isFollowed = response
    }
  } catch (error) {
    console.error('检查关注状态失败:', error)
  }
}

// 获取用户信息
const getUserInfo = async () => {
  try {
    const userId = route.params.id
    const response = await UserProfileApi.getUserInfo(userId)
    if (response) {
      userInfo.value = response
      // 如果已登录，检查关注状态
      if (userStore.user) {
        await checkFollowStatus(userId)
      }
    } else {
      throw new Error(response.msg || '获取用户信息失败')
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
    ElMessage.error(error.message || '获取用户信息失败')
  }
}

// 获取关注详情
const getFollowDetails = async () => {
  try {
    followLoading.value = true
    const userId = route.params.id
    const response = await UserProfileApi.getFollowDetails(userId)
    if (response) {
      followers.value = response.followers || []
      following.value = response.following || []
    }
  } catch (error) {
    console.error('获取关注详情失败:', error)
    ElMessage.error('获取关注详情失败')
  } finally {
    followLoading.value = false
  }
}

// 提交举报
const submitReport = async () => {
  if (!reportForm.value.typeId) {
    ElMessage.warning('请选择举报类型')
    return
  }

  try {
    reportLoading.value = true
    const userId = route.params.id
    await UserProfileApi.reportUser(
      userId,
      reportForm.value.typeId,
      reportForm.value.reason
    )
    ElMessage.success('举报成功')
    showReportDialog.value = false
    // 重置表单
    reportForm.value = {
      typeId: null,
      reason: ''
    }
  } catch (error) {
    console.error('举报失败:', error)
    ElMessage.error('举报失败')
  } finally {
    reportLoading.value = false
  }
}

// 格式化日期
const formatDate = (date) => {
  return new Date(date).toLocaleString()
}

// 获取用户帖子列表
const getUserPosts = async () => {
  try {
    postsLoading.value = true
    const userId = route.params.id
    const response = await UserProfileApi.getUserPosts(userId)
    // 从返回的数据结构中提取帖子列表
    posts.value = response.records || []
    console.log(posts.value)

  } catch (error) {
    console.error('获取用户帖子失败:', error)
    ElMessage.error('获取用户帖子失败')
  } finally {
    postsLoading.value = false
  }
}

// 查看帖子详情
const viewPost = (postId) => {
  router.push(`/post/${postId}`)
}

// 监听路由参数变化
watch(() => route.params.id, (newId, oldId) => {
  if (newId !== oldId) {
    getUserInfo()
    getFollowDetails()
    getUserPosts()
  }
})

// 处理关注/取消关注
const handleFollow = async () => {
  // 检查是否登录
  if (!userStore.user) {
    ElMessage.warning('请先登录')
    router.push('/login')
    return
  }

  // 不能关注自己
  if (userStore.user.id === parseInt(route.params.id)) {
    ElMessage.warning('不能关注自己')
    return
  }

  try {
    followLoading.value = true
    if (userInfo.value.isFollowed) {
      // 取消关注
      await request.delete(`/api/system/follow/${route.params.id}`)
      userInfo.value.followersCount--
      ElMessage.success('已取消关注')
    } else {
      // 关注
      await UserProfileApi.followUser(route.params.id)
      userInfo.value.followersCount++
      ElMessage.success('关注成功')
    }
    // 更新关注状态
    userInfo.value.isFollowed = !userInfo.value.isFollowed
    // 刷新关注列表
    await getFollowDetails()
  } catch (error) {
    console.error('关注操作失败:', error)
    ElMessage.error('操作失败')
  } finally {
    followLoading.value = false
  }
}

onMounted(() => {
  getUserInfo()
  getFollowDetails()
  getUserPosts()
})
</script>

<style scoped>
.user-profile {
  width: 1300px;
  margin: 0 auto;
  padding: 20px;
  min-height: 100vh;
}

.profile-layout {
  display: flex;
  gap: 24px;
  position: relative;
}

.profile-left {
  width: 360px;
  flex-shrink: 0;
  position: sticky;
  top: 20px;
  max-height: calc(100vh - 40px); /* 减去上下padding的值 */
  overflow-y: auto;
}

.profile-right {
  flex: 1;
  min-width: 0;
  /* 移除固定宽度 */
  /* width: 1400px; */
}

.profile-header {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
  overflow: hidden;
  margin-bottom: 20px;
}

.profile-cover {
  height: 200px;
  background: linear-gradient(135deg, #409EFF 0%, #66b1ff 100%);
}

.profile-info {
  padding: 24px;
  margin-top: -50px;
  position: relative;
}

.profile-avatar {
  border: 4px solid #fff;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.profile-details {
  margin-top: 16px;
}

.profile-name {
  font-size: 24px;
  font-weight: 600;
  color: #303133;
  margin: 0 0 8px;
}

.profile-meta {
  color: #909399;
  font-size: 14px;
  margin-bottom: 12px;
}

.profile-bio {
  color: #606266;
  font-size: 14px;
  line-height: 1.6;
  margin-bottom: 16px;
}

.profile-stats {
  display: flex;
  gap: 32px;
  margin-top: 16px;
}

.stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
}

.stat-item strong {
  font-size: 20px;
  color: #303133;
}

.stat-item span {
  font-size: 14px;
  color: #909399;
}

.profile-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.profile-actions {
  display: flex;
  gap: 12px;
}

.clickable {
  cursor: pointer;
  transition: all 0.3s;
}

.clickable:hover {
  color: #409EFF;
}

.follower-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  border-bottom: 1px solid #EBEEF5;
  cursor: pointer;
  transition: all 0.3s;
}

.follower-item:hover {
  background: #F5F7FA;
}

.follower-item:last-child {
  border-bottom: none;
}

.follower-info {
  flex: 1;
  min-width: 0;
}

.follower-name {
  font-size: 14px;
  font-weight: 500;
  color: #303133;
  margin-bottom: 4px;
}

.follower-bio {
  font-size: 12px;
  color: #909399;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.last-login {
  margin-left: 16px;
  color: #909399;
}

.posts-section {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
  padding: 24px;
  /* margin-top: 24px; */
}

.section-title {
  font-size: 20px;
  font-weight: 600;
  color: #303133;
  margin: 0 0 20px;
  padding-bottom: 16px;
  border-bottom: 1px solid #EBEEF5;
}

.posts-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.post-item {
  display: flex;
  gap: 16px;
  padding: 16px;
  border-radius: 8px;
  background: #f8f9fa;
  cursor: pointer;
  transition: all 0.3s;
}

.post-item:hover {
  background: #f0f2f5;
  transform: translateY(-2px);
}

.post-title {
  font-size: 16px;
  font-weight: 500;
  color: #303133;
  margin: 0 0 8px;
}

.post-content {
  font-size: 14px;
  color: #606266;
  margin: 0 0 12px;
  line-height: 1.6;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.post-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.post-time {
  font-size: 12px;
  color: #909399;
}

.post-stats {
  display: flex;
  gap: 16px;
}

.stat {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: 12px;
  color: #909399;
}

.post-header {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 12px;
}

.post-tags {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.post-tag {
  font-size: 12px;
}

.post-item {
  display: flex;
  gap: 16px;
  padding: 16px;
  border-radius: 8px;
  background: #f8f9fa;
  cursor: pointer;
  transition: all 0.3s;
}

.post-main {
  flex: 1;
  min-width: 0;
}

.post-cover {
  width: 160px;
  height: 120px;
  flex-shrink: 0;
  border-radius: 4px;
  overflow: hidden;
}

.post-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-logo {
  margin-top: 20px;
  padding: 16px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 16px;
}

.logo-image {
  max-width: 200px;
  height: auto;
}

.copyright-info {
  text-align: center;
  color: #909399;
}

.copyright-text {
  font-size: 12px;
  line-height: 1.8;
  margin: 0;
}

</style> 