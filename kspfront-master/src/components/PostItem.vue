<script setup>
import api from "@/api/base-api.js";
import { useRouter } from 'vue-router';
import { ElTag } from 'element-plus'
import { ref, onMounted, computed } from 'vue'
import Token from '@/stores/token.js'
import request from '@/utils/request.js'
import {
  View,
  ChatLineRound,
  Star,
  Share,
  ArrowRight,
  Timer,
  User,
  Collection,
  PriceTag
} from '@element-plus/icons-vue'

const router = useRouter()
const userInfo = ref(null)

const props = defineProps({
  post: {
    type: Object,
    required: true
  },
  isFavorite: {
    type: Boolean,
    default: false
  }
})

// 处理高亮内容
const renderHighlight = (content) => {
  if (!content) return ''
  return content.replace(/<em>/g, '<span class="highlight">').replace(/<\/em>/g, '</span>')
}

// 添加数据验证
const postData = computed(() => {
  if (!props.post) return null
  
  // 如果已经是正确的格式，直接返回
  if (props.post.post) return props.post
  
  // 如果是直接的帖子数据，进行转换
  return {
    post: {
      ...props.post,
      views: props.post.viewCount || 0,
      comments: props.post.commentCount || 0,
      likes: props.post.likeCount || 0,
      collections: props.post.shareCount || 0
    }
  }
})

// 处理后的标题和摘要
const title = computed(() => renderHighlight(postData.value?.post?.title))
const summary = computed(() => renderHighlight(postData.value?.post?.summary))

// 获取用户信息
const getUserInfo = async () => {
  if (!postData.value?.post?.userId) {
    console.warn('无效的用户ID')
    return
  }
  
  try {
    const response = await request.get(`/api/system/user/${postData.value.post.userId}`)
    if (response) {
      userInfo.value = response
    }
  } catch (error) {
    console.error('获取用户信息失败:', error)
  }
}

onMounted(() => {
  getUserInfo()
})

const goToDetail = () => {
  // 如果是收藏的帖子，使用 postId
  const postId = props.isFavorite ? props.post.postId : postData.value.post?.id
  
  
  if (!postId) {
    console.error('无效的帖子ID:', props.post)
    return
  }
  
  router.push(`/post/${postId}`)
}

// 格式化时间
const formatTime = (time) => {
  if (!time) return ''
  
  const date = new Date(time.replace(' ', 'T')) // 将后端日期格式转换为标准ISO格式
  const now = new Date()
  const diff = now - date
  
  // 小于1小时
  if (diff < 1000 * 60 * 60) {
    const minutes = Math.floor(diff / (1000 * 60))
    return `${minutes}分钟前`
  }
  // 小于24小时
  if (diff < 1000 * 60 * 60 * 24) {
    const hours = Math.floor(diff / (1000 * 60 * 60))
    return `${hours}小时前`
  }
  // 小于7天
  if (diff < 1000 * 60 * 60 * 24 * 7) {
    const days = Math.floor(diff / (1000 * 60 * 60 * 24))
    return `${days}天前`
  }
  // 大于7天，显示具体日期
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  
  // 如果是今年发布的，不显示年份
  const currentYear = new Date().getFullYear()
  if (year === currentYear) {
    return `${month}-${day} ${hours}:${minutes}`
  }
  return `${year}-${month}-${day} ${hours}:${minutes}`
}

// 将tags字符串转换为数组
const getTags = (tags) => {
  return tags ? tags.split(',') : []
}
</script>

<template>
  <div class="post-item" @click="goToDetail">
    <div class="post-cover" v-if="postData?.post?.cover">
      <img :src="postData.post.cover" :alt="postData.post.title" />
    </div>
    <div class="post-content">
      <div class="post-header">
        <h3 class="post-title" v-html="title"></h3>
        <div class="post-badges">
          <el-tag v-if="postData?.post?.isEssence" type="danger" size="small" effect="plain">
            <el-icon><Star /></el-icon>
            精华
          </el-tag>
        </div>
      </div>
      
      <p class="post-summary" v-if="postData?.post?.summary" v-html="summary"></p>
      
      <div class="post-info">
        <div class="tags" v-if="postData?.post?.tags">
          <el-tag
            v-for="tag in getTags(postData.post.tags)"
            :key="tag"
            size="small"
            effect="light"
            class="tag"
          >
            {{ tag }}
          </el-tag>
        </div>
        
        <div class="post-meta">
          <div class="user-info">
            <el-avatar 
              :size="24" 
              :src="userInfo?.avatar || '/images/default-avatar.png'"
              class="user-avatar"
            />
            <span class="author">{{ userInfo?.username || '用户' + postData?.post?.userId }}</span>
            <span class="dot">·</span>
            <span class="date">{{ formatTime(postData?.post?.publishTime) }}</span>
            <el-tag 
              v-if="userInfo?.isAdmin === 1" 
              size="small" 
              type="danger" 
              effect="plain"
              class="admin-tag"
            >
              管理员
            </el-tag>
          </div>
          <div class="stats">
            <span class="stat-item">
              <el-icon><View /></el-icon>
              {{ postData?.post?.views || 0 }}
            </span>
            <span class="stat-item">
              <el-icon><ChatLineRound /></el-icon>
              {{ postData?.post?.comments || 0 }}
            </span>
            <span class="stat-item">
              <el-icon><Star /></el-icon>
              {{ postData?.post?.likes || 0 }}
            </span>
            <span class="stat-item">
              <el-icon><Collection /></el-icon>
              {{ postData?.post?.collections || 0 }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.post-item {
  display: flex;
  gap: 20px;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.post-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.post-cover {
  flex: 0 0 200px;
  height: 134px;
  border-radius: 4px;
  overflow: hidden;
}

.post-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.post-item:hover .post-cover img {
  transform: scale(1.05);
}

.post-content {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
}

.post-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 12px;
  margin-bottom: 8px;
}

.post-title {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
  color: #1a1a1a;
  line-height: 1.4;
  flex: 1;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.post-badges {
  display: flex;
  gap: 8px;
  flex-shrink: 0;
}

.post-badges .el-tag {
  display: flex;
  align-items: center;
  gap: 4px;
}

.post-summary {
  margin: 0 0 12px;
  font-size: 14px;
  color: #666;
  line-height: 1.6;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.post-info {
  margin-top: auto;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 12px;
}

.tag {
  font-size: 12px;
}

.post-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
  color: #8590a6;
}

.user-info {
  display: flex;
  align-items: center;
  gap: 8px;
}

.user-avatar {
  border: 2px solid #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.admin-tag {
  font-size: 12px;
  height: 20px;
  padding: 0 6px;
}

.stats {
  display: flex;
  align-items: center;
  gap: 16px;
}

.stat-item {
  display: flex;
  align-items: center;
  gap: 4px;
}

.el-icon {
  font-size: 14px;
}

.dot {
  font-weight: bold;
}

@media screen and (max-width: 768px) {
  .post-item {
    padding: 12px;
    gap: 12px;
  }

  .post-cover {
    flex: 0 0 120px;
    height: 80px;
  }
  
  .post-header {
    margin-bottom: 6px;
  }

  .post-title {
    font-size: 16px;
  }

  .post-badges {
    display: none;
  }

  .post-summary {
    font-size: 13px;
    margin-bottom: 8px;
  }

  .tags {
    margin-bottom: 8px;
    gap: 6px;
  }
  
  .post-meta {
    font-size: 12px;
    flex-direction: column;
    align-items: flex-start;
    gap: 4px;
  }

  .stats {
    gap: 12px;
  }

  .user-info {
    gap: 6px;
  }

  .user-avatar {
    width: 20px;
    height: 20px;
  }

  .admin-tag {
    font-size: 11px;
    height: 18px;
    padding: 0 4px;
  }
}

@media screen and (max-width: 480px) {
  .post-cover {
    flex: 0 0 100px;
    height: 67px;
  }
}

.post-title :deep(.highlight),
.post-summary :deep(.highlight) {
  color: #409eff;
  font-weight: bold;
}
</style>