<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import request from '@/utils/request.js'
import { TrendCharts, Timer, Calendar, Star } from '@element-plus/icons-vue'
import RankPostItem from '@/components/RankPostItem.vue'
import PostDetailApi from '@/api/client/post-detail-api.js'
import PersonalFavoriteApi from '@/api/client/personal-favorite-api.js'

const currentRank = ref('daily') // 'daily' | 'weekly' | 'monthly'
const posts = ref([])
const loading = ref(false)
const userCache = ref(new Map()) // 用于缓存用户信息

// 收藏对话框
const showFavoriteDialog = ref(false)
const currentPost = ref(null)
const folders = ref([])
const selectedFolder = ref(null)

// 获取用户信息
const getUserInfo = async (userId) => {
  if (userCache.value.has(userId)) {
    return userCache.value.get(userId)
  }
  try {
    const data = await request.get(`/api/system/user/${userId}`)
    if (data) {
      userCache.value.set(userId, data)
      return data
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
    return null
  }
}

// 获取排行榜数据
const getRankData = async (type) => {
  loading.value = true
  try {
    const data = await request.get(`/api/client/rank/${type}`)
    if (data) {
      // 获取所有用户信息
      const userPromises = data.map(post => getUserInfo(post.userId))
      const users = await Promise.all(userPromises)
      
      posts.value = data.map((post, index) => ({
        post: {
          ...post,
          coverUrl: post.cover,
          publishTime: post.publishTime,
          viewCount: post.viewCount,
          likeCount: post.likeCount,
          commentCount: post.commentCount
        },
        author: {
          ...users[index],
          username: users[index]?.username || '未知用户',
          avatarUrl: users[index]?.avatarUrl || '/images/default-avatar.png'
        }
      }))
    }
  } catch (error) {
    console.error('获取排行榜数据失败:', error)
    ElMessage.error('获取排行榜数据失败')
  } finally {
    loading.value = false
  }
}

// 格式化时间
const formatTime = (time) => {
  if (!time) return ''
  const date = new Date(time)
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`
}

// 切换排行榜类型
const handleRankTypeChange = (type) => {
  currentRank.value = type
  getRankData(type)
}

// 获取收藏夹列表
const getFolders = async () => {
  try {
    const response = await PersonalFavoriteApi.getFolderList()
    if (response?.records) {
      folders.value = response.records.filter(folder => !folder.isDeleted)
    }
  } catch (error) {
    console.error('获取收藏夹列表失败:', error)
    ElMessage.error('获取收藏夹列表失败')
  }
}

// 打开收藏对话框
const openFavoriteDialog = async (post) => {
  currentPost.value = post
  showFavoriteDialog.value = true
  await getFolders()
}

// 收藏帖子
const handleFavorite = async () => {
  if (!selectedFolder.value) {
    ElMessage.warning('请选择收藏夹')
    return
  }
  
  try {
    await PostDetailApi.favoritePost(currentPost.value.post.id, selectedFolder.value)
    ElMessage.success('收藏成功')
    showFavoriteDialog.value = false
    selectedFolder.value = null
  } catch (error) {
    console.error('收藏失败:', error)
    ElMessage.error('收藏失败')
  }
}

onMounted(() => {
  getRankData('daily')
})
</script>

<template>
  <div class="rank-view">
    <div class="rank-header">
      <h2 class="rank-title">排行榜</h2>
      <div class="rank-tabs">
        <el-radio-group v-model="currentRank" @change="handleRankTypeChange">
          <el-radio-button label="daily">
            <el-icon><Timer /></el-icon>
            日榜
          </el-radio-button>
          <el-radio-button label="weekly">
            <el-icon><TrendCharts /></el-icon>
            周榜
          </el-radio-button>
          <el-radio-button label="monthly">
            <el-icon><Calendar /></el-icon>
            月榜
          </el-radio-button>
        </el-radio-group>
      </div>
    </div>

    <div class="rank-content">
      <!-- 骨架屏 -->
      <template v-if="loading && posts.length === 0">
        <div class="skeleton-container" v-for="i in 3" :key="i">
          <el-skeleton animated>
            <template #template>
              <div class="skeleton-item">
                <div style="display: flex; gap: 16px; align-items: center">
                  <el-skeleton-item variant="text" style="width: 40px" />
                  <el-skeleton-item variant="image" style="width: 120px; height: 80px" />
                  <div style="flex: 1">
                    <el-skeleton-item variant="h3" style="width: 50%" />
                    <div style="display: flex; align-items: center; gap: 16px; margin-top: 8px">
                      <el-skeleton-item variant="text" style="width: 20%" />
                      <el-skeleton-item variant="text" style="width: 15%" />
                      <el-skeleton-item variant="text" style="width: 15%" />
                    </div>
                  </div>
                </div>
              </div>
            </template>
          </el-skeleton>
        </div>
      </template>

      <!-- 帖子列表 -->
      <div class="post-list" v-else>
        <transition-group name="post-list">
          <div v-for="(post, index) in posts" 
               :key="post.post.id" 
               class="post-item-wrapper"
               :class="{'top-three': index < 3}">
            <div class="rank-number" :class="{'top-three': index < 3}">{{ index + 1 }}</div>
            <div class="post-cover" @click="$router.push(`/post/${post.post.id}`)">
              <img :src="post.post.cover || '/images/default-cover.png'" :alt="post.post.title">
            </div>
            <div class="post-info" @click="$router.push(`/post/${post.post.id}`)">
              <h3 class="post-title">{{ post.post.title }}</h3>
              <div class="post-summary" v-if="post.post.summary">{{ post.post.summary }}</div>
              <div class="post-meta">
                <span class="author">{{ post.author.username }}</span>
                <span class="dot">·</span>
                <span class="time">{{ formatTime(post.post.publishTime) }}</span>
                <span class="dot">·</span>
                <span>{{ post.post.viewCount || 0 }} 浏览</span>
                <span class="dot">·</span>
                <span>{{ post.post.likeCount || 0 }} 点赞</span>
                <span class="dot">·</span>
                <span>{{ post.post.commentCount || 0 }} 评论</span>
              </div>
            </div>
            <div class="post-actions">
              <el-button 
                type="primary" 
                plain 
                size="small" 
                @click.stop="openFavoriteDialog(post)"
              >
                <el-icon><Star /></el-icon>
                收藏
              </el-button>
            </div>
          </div>
        </transition-group>
      </div>

      <!-- 无数据提示 -->
      <div class="no-data" v-if="!loading && posts.length === 0">
        <el-empty description="暂无数据" :image-size="200" />
      </div>
    </div>

    <!-- 收藏对话框 -->
    <el-dialog
      v-model="showFavoriteDialog"
      title="收藏到"
      width="400px"
      :close-on-click-modal="false"
    >
      <div class="favorite-dialog-content">
        <template v-if="folders.length > 0">
          <el-radio-group v-model="selectedFolder" class="folder-list">
            <el-radio
              v-for="folder in folders"
              :key="folder.id"
              :label="folder.id"
              class="folder-item"
            >
              <div class="folder-info">
                <span class="folder-name">{{ folder.folderName }}</span>
                <span class="folder-count">{{ folder.favoriteCount || 0 }}个内容</span>
              </div>
            </el-radio>
          </el-radio-group>
        </template>
        <el-empty v-else description="暂无收藏夹" />
      </div>
      <template #footer>
        <el-button @click="showFavoriteDialog = false">取消</el-button>
        <el-button type="primary" @click="handleFavorite" :disabled="!selectedFolder">
          确定
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.rank-view {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  background-color: #f5f7fa;
  min-height: 100vh;
  box-sizing: border-box;
}

.rank-header {
  margin-bottom: 24px;
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.rank-content {
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.rank-title {
  margin: 0;
  font-size: 22px;
  font-weight: 600;
  color: #1a1a1a;
  display: flex;
  align-items: center;
  gap: 8px;
}

.rank-title::before {
  content: "";
  display: block;
  width: 4px;
  height: 22px;
  background: #1890ff;
  border-radius: 2px;
}

.rank-tabs {
  display: flex;
  align-items: center;
}

.rank-tabs :deep(.el-radio-group) {
  display: flex;
  gap: 8px;
}

.rank-tabs :deep(.el-radio-button__inner) {
  border: none;
  background: #f5f7fa;
  color: #606266;
  height: 32px;
  padding: 0 16px;
  font-size: 14px;
  border-radius: 16px !important;
  box-shadow: none;
  display: flex;
  align-items: center;
  gap: 4px;
}

.rank-tabs :deep(.el-icon) {
  margin-right: 4px;
}

.rank-tabs :deep(.el-radio-button:first-child .el-radio-button__inner) {
  border-radius: 16px !important;
}

.rank-tabs :deep(.el-radio-button:last-child .el-radio-button__inner) {
  border-radius: 16px !important;
}

.rank-tabs :deep(.el-radio-button__original-radio:checked + .el-radio-button__inner) {
  background: #1890ff;
  color: #fff;
  box-shadow: none;
}

.rank-tabs :deep(.el-radio-button__inner:hover) {
  color: #1890ff;
}

.rank-tabs :deep(.el-radio-button__original-radio:checked + .el-radio-button__inner:hover) {
  color: #fff;
}

.post-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.post-item-wrapper {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  padding: 20px;
  background: #fff;
  border-radius: 12px;
  transition: all 0.3s ease;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
  cursor: pointer;
}

.post-item-wrapper:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
}

.post-item-wrapper.top-three {
  background: #fff;
  border: 1px solid #ffd6d6;
}

.post-item-wrapper.top-three:hover {
  background: #fff;
  border: 1px solid #ffbebe;
}

.rank-number {
  font-size: 24px;
  font-weight: 600;
  color: #909399;
  min-width: 40px;
  text-align: center;
}

.rank-number.top-three {
  color: #f56c6c;
  font-size: 28px;
}

.post-cover {
  width: 200px;
  height: 120px;
  border-radius: 8px;
  overflow: hidden;
  flex-shrink: 0;
  background-color: #f5f6f7;
}

.post-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.post-info {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.post-title {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
  color: #1a1a1a;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.post-summary {
  margin: 0;
  font-size: 14px;
  color: #86909c;
  line-height: 1.5;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.post-meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 8px;
  color: #86909c;
  font-size: 13px;
}

.post-meta .author {
  color: #4e5969;
  font-weight: 500;
}

.post-meta .time {
  color: #86909c;
}

.post-meta .dot {
  color: #c9cdd4;
}

.skeleton-container {
  margin-bottom: 16px;
}

.skeleton-item {
  padding: 20px;
  background: #f7f8fa;
  border-radius: 8px;
}

.no-data {
  padding: 60px 0;
  text-align: center;
}

/* 列表动画 */
.post-list-enter-active,
.post-list-leave-active {
  transition: all 0.3s ease;
}

.post-list-enter-from {
  opacity: 0;
  transform: translateY(20px);
}

.post-list-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

@media screen and (max-width: 768px) {
  .rank-view {
    padding: 12px;
  }

  .rank-header, .rank-content {
    padding: 16px;
  }

  .post-list {
    gap: 12px;
  }

  .post-item-wrapper {
    padding: 12px;
    gap: 12px;
  }

  .rank-number {
    font-size: 18px;
    width: 28px;
  }

  .rank-number.top-three {
    font-size: 22px;
  }

  .post-cover {
    width: 120px;
    height: 80px;
  }

  .post-title {
    font-size: 15px;
  }

  .post-summary {
    font-size: 12px;
    -webkit-line-clamp: 1;
  }

  .post-meta {
    font-size: 12px;
    gap: 6px;
  }

  .rank-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 16px;
    padding: 16px;
  }

  .rank-title {
    font-size: 20px;
  }

  .rank-title::before {
    height: 20px;
  }

  .rank-tabs {
    width: 100%;
  }

  .rank-tabs :deep(.el-radio-group) {
    width: 100%;
  }

  .rank-tabs :deep(.el-radio-button) {
    flex: 1;
  }

  .rank-tabs :deep(.el-radio-button__inner) {
    width: 100%;
    padding: 0 8px;
    font-size: 13px;
  }
}

.post-actions {
  display: flex;
  gap: 8px;
  margin-left: auto;
  padding-left: 16px;
}

.post-actions .el-button {
  display: flex;
  align-items: center;
  gap: 4px;
}

.favorite-dialog-content {
  max-height: 400px;
  overflow-y: auto;
}

.folder-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  width: 100%;
}

.folder-item {
  margin: 0 !important;
  padding: 12px;
  border-radius: 8px;
  transition: background-color 0.2s ease;
}

.folder-item:hover {
  background-color: #f5f7fa;
}

.folder-info {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.folder-name {
  font-size: 14px;
  font-weight: 500;
  color: #1a1a1a;
}

.folder-count {
  font-size: 12px;
  color: #86909c;
}

@media screen and (max-width: 768px) {
  .post-actions {
    padding-left: 12px;
  }

  .post-actions .el-button {
    padding: 6px 12px;
  }

  .folder-item {
    padding: 8px;
  }

  .folder-name {
    font-size: 13px;
  }

  .folder-count {
    font-size: 11px;
  }
}
</style> 