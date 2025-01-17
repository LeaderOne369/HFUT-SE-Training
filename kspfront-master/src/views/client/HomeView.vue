<script setup lang="ts">
import {nextTick, onMounted, ref} from "vue";
import {throttle} from "lodash";
import { ElSkeleton, ElSkeletonItem } from 'element-plus'
import HomepageApi from "@/api/client/homepage-api.js";
import { ElMessage } from 'element-plus'
import { Bell, Loading, User, Star, InfoFilled, Service, House, Message, ChatDotRound } from '@element-plus/icons-vue'
import PostItem from "@/components/PostItem.vue";

interface UserBrief {
  id: number;
  username: string;
  avatarUrl?: string;
  bio?: string;
}

interface Section {
  id: number;
  sectionName: string;
}

interface Post {
  id: number;
  userId: number;
  title: string;
  cover?: string;
  summary?: string;
  tags?: string;
  viewCount: number;
  commentCount: number;
  likeCount: number;
  shareCount: number;
  publishTime: string;
  views?: number;
  comments?: number;
  likes?: number;
  collections?: number;
  isEssence?: number;
  status?: number;
  isPinned?: number;
  visibility?: number;
  reviewStatus?: number;
  isDeleted?: number;
}

interface Author {
  id: number;
  username: string;
  avatarUrl?: string;
}

interface PostItem {
  post: Post;
  author: Author;
}

interface ApiResponse<T> {
  code: number;
  msg: string | null;
  data: T;
}

const list = ref<PostItem[]>([]);
const loading = ref(false);
const userBrief = ref<UserBrief | null>(null);
const sections = ref<Section[]>([]);
const homeViewRef = ref<HTMLElement | null>(null);

// 加载状态
const loadingStates = ref({
  userBrief: false,
  sections: false,
  recommend: false
});

onMounted(() => {
  loadAllData()
  setupScrollListener()
})

function setupScrollListener() {
  nextTick(() => {
    if (homeViewRef.value) {
      homeViewRef.value.addEventListener('scroll', throttle(() => {
        const el = homeViewRef.value
        if (el.scrollTop + el.clientHeight >= el.scrollHeight - 10) {
          console.log('到底了')
          getMoreRecommend()
        }
      }, 100))
    }
  })
}

// 获取用户简要信息
const getUserBrief = async () => {
  try {
    const response = await HomepageApi.getUserBrief()
    if (response.data.code === 200) {
      userBrief.value = response.data.data
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
    ElMessage.error('获取用户信息失败')
  }
}

// 获取分区列表
const getSections = async () => {
  try {
    const response = await HomepageApi.getSections()
    if (response.data.code === 200) {
      sections.value = response.data.data
    }
  } catch (error) {
    console.error('获取分区列表失败:', error)
    ElMessage.error('获取分区列表失败')
  }
}

// 获取推荐内容
const getRecommendContent = async () => {
  try {
    const response = await HomepageApi.getRecommend()
    console.log('推荐内容原始响应:', response)
    
    // 清理响应数据中的无效JSON
    let cleanedData = response.data
    if (typeof cleanedData === 'string') {
      // 处理空的citation字段
      cleanedData = cleanedData.replace(/"citation":,/g, '"citation":null,')
      // 处理其他可能的无效JSON格式
      cleanedData = cleanedData.replace(/,\s*}/g, '}')
      cleanedData = cleanedData.replace(/,\s*]/g, ']')
    }
    
    // 解析响应数据
    const responseData = typeof cleanedData === 'string' ? JSON.parse(cleanedData) : cleanedData
    console.log('解析后的响应数据:', responseData)
    
    if (responseData?.code === 200 && Array.isArray(responseData.data)) {
      list.value = responseData.data.map(item => ({
        post: {
          ...item.post,
          // 确保所有必需的字段都有默认值
          viewCount: item.post.viewCount || 0,
          commentCount: item.post.commentCount || 0,
          likeCount: item.post.likeCount || 0,
          shareCount: item.post.shareCount || 0,
          isPinned: item.post.isPinned || 0,
          isEssence: item.post.isEssence || 0,
          tags: item.post.tags || '',
          citation: item.post.citation || null
        },
        author: {
          id: item.author.id,
          username: item.author.username,
          avatarUrl: item.author.avatarUrl || '/images/default-avatar.png'
        }
      }))
    } else {
      console.warn('推荐内容响应格式不正确:', responseData)
      list.value = []
    }
  } catch (error) {
    console.error('获取推荐内容失败:', error)
    ElMessage.error('获取推荐内容失败')
    list.value = []
  }
}

// 加载所有数据
const loadAllData = async () => {
  loading.value = true
  try {
    await Promise.all([
      getUserBrief(),
      getSections(),
      getRecommendContent()
    ])
  } catch (error) {
    console.error('加载数据失败:', error)
  } finally {
    loading.value = false
  }
}

// 加载更多推荐内容
const getMoreRecommend = async () => {
  if (loading.value) return
  loading.value = true
  try {
    const response = await HomepageApi.getRecommend()
    console.log('加载更多推荐原始响应:', response)
    
    // 清理响应数据中的无效JSON
    let cleanedData = response.data
    if (typeof cleanedData === 'string') {
      // 处理空的citation字段
      cleanedData = cleanedData.replace(/"citation":,/g, '"citation":null,')
      // 处理其他可能的无效JSON格式
      cleanedData = cleanedData.replace(/,\s*}/g, '}')
      cleanedData = cleanedData.replace(/,\s*]/g, ']')
    }
    
    // 解析响应数据
    const responseData = typeof cleanedData === 'string' ? JSON.parse(cleanedData) : cleanedData
    console.log('解析后的响应数据:', responseData)
    
    if (responseData?.code === 200 && Array.isArray(responseData.data)) {
      const newPosts = responseData.data.map(item => ({
        post: {
          ...item.post,
          viewCount: item.post.viewCount || 0,
          commentCount: item.post.commentCount || 0,
          likeCount: item.post.likeCount || 0,
          shareCount: item.post.shareCount || 0,
          isPinned: item.post.isPinned || 0,
          isEssence: item.post.isEssence || 0,
          tags: item.post.tags || '',
          citation: item.post.citation || null
        },
        author: {
          id: item.author.id,
          username: item.author.username,
          avatarUrl: item.author.avatarUrl || '/images/default-avatar.png'
        }
      }))
      list.value = [...list.value, ...newPosts]
    } else {
      console.warn('加载更多推荐响应格式不正确:', responseData)
    }
  } catch (error) {
    console.error('获取更多推荐失败:', error)
    ElMessage.error('获取更多推荐失败')
  } finally {
    loading.value = false
  }
}

// 帖子处理方法
function getPostData(item: PostItem) {

  if (!item || !item.post) {
    console.warn('无效的帖子数据:', item)
    return null
  }

  try {
    const processedData = {
      post: {
        ...item.post,
        views: item.post.viewCount || 0,
        comments: item.post.commentCount || 0,
        likes: item.post.likeCount || 0,
        collections: item.post.shareCount || 0,
        isEssence: item.post.isEssence || 0
      },
      author: {
        id: item.author.id,
        username: item.author.username,
        avatarUrl: item.author.avatarUrl || '/images/default-avatar.png'
      }
    }
  
    return processedData
  } catch (error) {
    console.error('处理帖子数据时出错:', error)
    return null
  }
}

// 获取热门帖子（按浏览量排序）
function getHotPosts() {
  return [...list.value]
    .sort((a, b) => b.post.viewCount - a.post.viewCount)
    .slice(0, 5)
}

const handleFeedbackClick = () => {
  // 可以在这里添加特殊的点击处理逻辑
  console.log('反馈文字被点击')
}
</script>

<template>
  <div class="home-view" ref="homeViewRef">
    <!-- 顶部区域：用户简介和分区导航 -->
    <!-- <div class="top-section" v-if="userBrief || sections.length">
     
      <div class="user-brief" v-if="userBrief" v-loading="loadingStates.userBrief">
        <div class="avatar-wrapper">
          <img v-if="userBrief.avatarUrl" :src="userBrief.avatarUrl" class="avatar" alt="用户头像" />
          <el-icon v-else><User /></el-icon>
        </div>
        <div class="user-info">
          <h3>{{ userBrief.username }}</h3>
          <p class="bio">{{ userBrief.bio || '这个人很懒，什么都没写~' }}</p>
        </div>
      </div>

      <div class="section-nav" v-loading="loadingStates.sections">
        <div class="section-list">
          <template v-if="sections.length">
            <router-link
              v-for="section in sections"
              :key="section.id"
              :to="'/category?section=' + section.id"
              class="section-item"
            >
              {{ section.sectionName }}
            </router-link>
          </template>
          <div v-else>暂无分区</div>
        </div>
      </div>
    </div> -->

    <!-- 主要内容区域 - 两栏布局 -->
    <div class="main-content">
      <!-- 左侧帖子列表 -->
      <div class="content-left">
        <!-- 骨架屏 -->
        <template v-if="loading && list.length === 0">
          <div class="skeleton-container" v-for="i in 3" :key="i">
            <el-skeleton animated>
              <template #template>
                <div class="skeleton-item">
                  <el-skeleton-item variant="image" style="width: 240px; height: 180px" />
                  <div style="padding: 14px">
                    <el-skeleton-item variant="h3" style="width: 50%" />
                    <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 8px">
                      <el-skeleton-item variant="text" style="margin-right: 16px" />
                      <el-skeleton-item variant="text" style="width: 30%" />
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
            <post-item 
              v-for="item in list" 
              :key="item.post.id" 
              :post="getPostData(item)"
              class="post-item"
            />
          </transition-group>
        </div>

        <!-- 无数据提示 -->
        <div class="no-data" v-if="!loading && list.length === 0">
          <el-empty 
            description="暂无内容" 
            :image-size="200"
          />
        </div>

        <!-- 加载更多提示 -->
        <div class="load-more" v-if="loading && list.length > 0">
          <el-icon class="loading-icon"><Loading /></el-icon>
          <span>加载更多...</span>
        </div>
      </div>

      <!-- 右侧推荐内容 -->
      <div class="content-right">
        <div class="recommend-section">
          <h3 class="recommend-title">
            <el-icon><Star /></el-icon>
            热门内容
          </h3>
          <div class="recommend-list">
            <template v-if="getHotPosts().length">
              <div v-for="(item, index) in getHotPosts()" :key="item.post.id" class="recommend-item">
                <span class="recommend-index" :class="{ 'top-three': index < 3 }">{{ index + 1 }}</span>
                <div class="recommend-info">
                  <router-link :to="'/post/' + item.post.id" class="recommend-title-link">
                    {{ item.post.title }}
                  </router-link>
                  <div class="recommend-meta">
                    <span>{{ item.post.viewCount || 0 }} 浏览</span>
                    <span>{{ item.post.likeCount || 0 }} 点赞</span>
                  </div>
                </div>
              </div>
            </template>
            <div v-else class="no-recommend">
              暂无热门内容
            </div>
          </div>
        </div>

        <!-- 帮助中心链接 -->
        <div class="help-section">
          <h3 class="help-title">
            <el-icon><InfoFilled /></el-icon>
            更多信息
          </h3>
          <div class="help-links">
            <router-link to="/help" class="help-link">
              <el-icon><Service /></el-icon>
              帮助中心
            </router-link>
            <router-link to="/about" class="help-link">
              <el-icon><House /></el-icon>
              关于平台
            </router-link>
            <router-link to="/contact" class="help-link">
              <el-icon><Message /></el-icon>
              联系我们
            </router-link>
          </div>
          <router-link to="/feedback" class="feedback-tip">
            <el-icon><ChatDotRound /></el-icon>
            如果您有任何建议，欢迎<span class="feedback-text" @click.stop="handleFeedbackClick">反馈</span>给我们
          </router-link>
        </div>

        <!-- Logo 卡片 -->
        <div class="logo-section">
          <img src="../../assets/images/logo.png" alt="平台 Logo" class="logo-image" />
          <div class="copyright-info">
            <p class="copyright-text">© 2024 知识分享平台</p>
            <p class="copyright-text">All Rights Reserved Version 1.0.0</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.home-view {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  background-color: #f5f7fa;
  min-height: 100vh;
  box-sizing: border-box;
  position: relative;
}

@media screen and (max-width: 768px) {
  .home-view {
    padding: 12px;
  }
}

.top-section {
  background: white;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.user-brief {
  display: flex;
  align-items: center;
  gap: 15px;
  flex: 0 0 300px;
}

.avatar-wrapper {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  overflow: hidden;
  background: #f0f2f5;
  display: flex;
  align-items: center;
  justify-content: center;
}

.avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.user-info {
  flex: 1;
}

.user-info h3 {
  margin: 0 0 8px 0;
  font-size: 18px;
  color: #303133;
}

.bio {
  margin: 0;
  color: #909399;
  font-size: 14px;
}

.section-nav {
  flex: 1;
  margin-left: 20px;
}

.section-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.section-item {
  padding: 6px 16px;
  background: #f0f2f5;
  border-radius: 16px;
  color: #606266;
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s;
}

.section-item:hover {
  background: #e6f1fc;
  color: #409eff;
}

.main-content {
  display: flex;
  gap: 20px;
  margin-top: 20px;
  position: relative;
}

.content-left {
  flex: 1;
  min-width: 0;
}

.content-right {
  width: 300px;
  flex-shrink: 0;
  position: sticky;
  top: 80px;
  height: fit-content;
  align-self: flex-start;
}

.recommend-section {
  background: white;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}

.recommend-title {
  margin: 0 0 15px 0;
  font-size: 16px;
  color: #303133;
  display: flex;
  align-items: center;
  gap: 8px;
}

.recommend-title .el-icon {
  font-size: 18px;
  color: #409eff;
}

.recommend-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.recommend-item {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 8px;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.recommend-item:hover {
  background-color: #f5f7fa;
}

.recommend-index {
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f0f2f5;
  border-radius: 4px;
  color: #909399;
  font-size: 14px;
  font-weight: bold;
}

.recommend-index.top-three {
  background: #e6f1fc;
  color: #409eff;
}

.recommend-info {
  flex: 1;
  min-width: 0;
}

.recommend-title-link {
  display: block;
  color: #303133;
  text-decoration: none;
  font-size: 14px;
  margin-bottom: 4px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.recommend-title-link:hover {
  color: #409eff;
}

.recommend-meta {
  display: flex;
  gap: 12px;
  color: #909399;
  font-size: 12px;
}

.post-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.post-item {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  transition: transform 0.3s;
}

.post-item:hover {
  transform: translateY(-2px);
}

.skeleton-container {
  background: white;
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
}

.load-more {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 20px;
  color: #909399;
  font-size: 14px;
}

.loading-icon {
  animation: rotate 1s linear infinite;
}

@keyframes rotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.post-list-enter-active,
.post-list-leave-active {
  transition: all 0.3s ease;
}

.post-list-enter-from,
.post-list-leave-to {
  opacity: 0;
  transform: translateY(30px);
}

.no-recommend {
  padding: 20px;
  text-align: center;
  color: #999;
}

.help-section {
  background: white;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.help-title {
  margin: 0 0 15px 0;
  font-size: 16px;
  color: #303133;
  display: flex;
  align-items: center;
  gap: 8px;
}

.help-title .el-icon {
  font-size: 18px;
  color: #409eff;
}

.help-links {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.help-link {
  color: #606266;
  text-decoration: none;
  font-size: 14px;
  transition: color 0.3s;
  display: flex;
  align-items: center;
  gap: 8px;
  padding-left: 2px;
}

.help-link .el-icon {
  font-size: 16px;
  color: #909399;
  transition: color 0.3s;
}

.help-link:hover .el-icon {
  color: #409eff;
}

.logo-section {
  border-radius: 8px;
  padding: 2px;
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 16px;
}

.logo-image {
  width: 180px;
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

.feedback-tip {
  margin-top: 16px;
  padding-top: 16px;
  border-top: 1px solid #ebeef5;
  color: #909399;
  font-size: 13px;
  text-align: center;
  text-decoration: none;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: color 0.3s;
}

.feedback-tip:hover {
  color: #409eff;
}

.feedback-tip .el-icon {
  font-size: 14px;
}

.feedback-text {
  color: #409eff;
  cursor: pointer;
  font-weight: 500;
  transition: color 0.3s;
}

.feedback-text:hover {
  color: #66b1ff;
}
</style>
