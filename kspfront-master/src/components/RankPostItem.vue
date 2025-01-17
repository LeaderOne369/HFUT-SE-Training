<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps({
  post: {
    type: Object,
    required: true
  }
})

const router = useRouter()

const formatDate = (timestamp) => {
  const date = new Date(timestamp)
  return `${date.getMonth() + 1}月${date.getDate()}日`
}

const handleClick = () => {
  router.push(`/post/${props.post.post.id}`)
}
</script>

<template>
  <div class="rank-post-item" @click="handleClick">
    <div class="post-info">
      <h3 class="post-title">{{ post.post.title }}</h3>
      <p class="post-summary" v-if="post.post.summary">{{ post.post.summary }}</p>
      <div class="post-meta">
        <span class="author">{{ post.author.username }}</span>
        <span class="dot">·</span>
        <span class="likes">{{ post.post.likes || 0 }} 点赞</span>
        <span class="dot">·</span>
        <span class="views" v-if="post.post.views">{{ post.post.views }} 浏览</span>
        <span class="dot" v-if="post.post.views">·</span>
        <span class="date">{{ formatDate(post.post.createTime) }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.rank-post-item {
  background: #fff;
  padding: 24px 32px;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.rank-post-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.post-info {
  flex: 1;
}

.post-title {
  margin: 0;
  font-size: 20px;
  font-weight: 600;
  color: #1a1a1a;
  line-height: 1.4;
  margin-bottom: 12px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.post-summary {
  margin: 0 0 16px;
  font-size: 15px;
  color: #666;
  line-height: 1.6;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.post-meta {
  font-size: 14px;
  color: #8590a6;
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}

.dot {
  font-weight: bold;
}

@media screen and (max-width: 768px) {
  .rank-post-item {
    padding: 16px;
  }
  
  .post-title {
    font-size: 16px;
    margin-bottom: 8px;
  }

  .post-summary {
    font-size: 14px;
    margin-bottom: 12px;
  }
  
  .post-meta {
    font-size: 12px;
    gap: 4px;
  }
}
</style> 