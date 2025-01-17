<script setup>
import { ref, onMounted, h } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import PostDetailApi from '@/api/client/post-detail-api'
import PersonalFavoriteApi from '@/api/client/personal-favorite-api'
import { Share, Warning, ChatRound, Star, Pointer, MoreFilled, InfoFilled, Plus } from '@element-plus/icons-vue'

const route = useRoute()
const router = useRouter()
const postId = ref(null)
const postDetail = ref(null)
const postStats = ref(null)
const loading = ref(true)
const replyContent = ref('')
const showReplyDialog = ref(false)
const contentHtml = ref('')
const comments = ref([])
const commentsLoading = ref(false)

// 举报类型列表
const reportTypes = ref([])
const reportedTypes = ref([])
const selectedReportType = ref(null)
const selectedReportedType = ref(null)
const reportReason = ref('')

// 举报对话框状态
const showReportDialog = ref(false)
const reportDialogTitle = ref('')
const reportTargetId = ref(null)
const reportTargetType = ref('post') // 'post' 或 'comment'

// 收藏相关
const showFavoriteDialog = ref(false)
const folders = ref([])
const selectedFolder = ref(null)
const foldersLoading = ref(false)
const currentFolderPage = ref(1)
const folderPageSize = ref(10)
const totalFolders = ref(0)

// 新建收藏夹相关
const showCreateFolderDialog = ref(false)
const newFolderName = ref('')
const newFolderDescription = ref('')
const createFolderLoading = ref(false)

// 收藏列表相关
const favoriteList = ref([])
const favoriteListLoading = ref(false)
const currentFavoritePage = ref(1)
const favoritePageSize = ref(10)
const totalFavorites = ref(0)

// 在 script setup 部分添加新的响应式变量
const isCollected = ref(false)
const isLiked = ref(false)

// 添加一个变量存储当前帖子所在的收藏夹ID
const currentFolderId = ref(null)

// 获取举报类型
const getReportTypes = async () => {
  try {
    const [reportedTypesRes, reportTypesRes] = await Promise.all([
      PostDetailApi.getReportedTypes(),
      PostDetailApi.getReportTypes()
    ])
    // 只保留 isActive 为 1 的类型
    reportedTypes.value = reportedTypesRes.filter(type => type.isActive === 1)
    reportTypes.value = reportTypesRes
    console.log('举报对象类型:', reportedTypes.value)
    console.log('举报类型:', reportTypes.value)
    // 默认选择第一个举报类型
    if (reportTypes.value.length > 0) {
      selectedReportType.value = reportTypes.value[0].id
    }
  } catch (error) {
    console.error('获取举报类型失败:', error)
  }
}

// 获取帖子详情
const getPostDetail = async () => {
  try {
    console.log('获取帖子详情, postId:', postId.value)
    const response = await PostDetailApi.getPostDetail(postId.value)
    console.log('帖子详情响应:', response)
    postDetail.value = response
    // 从 stats 中获取状态
    if (response.stats) {
      isCollected.value = response.stats.isFavorited || false
      isLiked.value = response.stats.isLiked || false
    }
    if (postDetail.value?.contentFilePath) {
      await loadPostContent()
    }
  } catch (error) {
    console.error('获取帖子详情失败:', error)
    ElMessage.error('获取帖子详情失败')
  }
}

// 获取帖子统计信息
const getPostStats = async () => {
  try {
    console.log('获取帖子统计信息, postId:', postId.value)
    const response = await PostDetailApi.getPostStats(postId.value)
    console.log('帖子统计信息响应:', response)
    postStats.value = response
    // 更新状态
    isCollected.value = response.isFavorited || false
    isLiked.value = response.isLiked || false
  } catch (error) {
    console.error('获取帖子统计信息失败:', error)
    ElMessage.error('获取帖子统计信息失败')
  }
}

// 记录浏览
const recordView = async () => {
  try {
    console.log('记录帖子浏览, postId:', postId.value)
    const response = await PostDetailApi.viewPost(postId.value)
    console.log('记录浏览响应:', response)
  } catch (error) {
    console.error('记录浏览失败:', error)
  }
}

// 分享帖子
const handleShare = async () => {
  try {
    console.log('分享帖子, postId:', postId.value)
    const response = await PostDetailApi.sharePost(postId.value)
    console.log('分享帖子响应:', response)
    ElMessage.success('分享成功')
    getPostStats()
  } catch (error) {
    console.error('分享失败:', error)
    ElMessage.error('分享失败')
  }
}

// 显示举报对话框
const showReportDialogFor = (type, id, title) => {
  reportTargetType.value = type
  reportTargetId.value = id
  reportDialogTitle.value = title
  reportReason.value = ''
  selectedReportType.value = reportTypes.value[0]?.id
  // 根据举报目标类型设置对应的举报对象类型
  const targetTypeMap = {
    'post': 1, // 帖子类型ID
    'comment': 2 // 评论类型ID
  }
  selectedReportedType.value = targetTypeMap[type]
  showReportDialog.value = true
}

// 提交举报
const submitReport = async () => {
  try {
    if (!selectedReportType.value) {
      ElMessage.warning('请选择举报类型')
      return
    }

    if (reportTargetType.value === 'post') {
      await PostDetailApi.reportPost(reportTargetId.value, selectedReportType.value, reportReason.value)
    } else {
      await PostDetailApi.reportComment(reportTargetId.value, selectedReportType.value, reportReason.value)
    }

    ElMessage.success('举报成功')
    showReportDialog.value = false
  } catch (error) {
    console.error('举报失败:', error)
    ElMessage.error('举报失败')
  }
}

// 举报帖子
const handleReport = () => {
  showReportDialogFor('post', postId.value, '举报帖子')
}

// 举报评论
const handleReportComment = (comment) => {
  showReportDialogFor('comment', comment.id, '举报评论')
}

// 回复帖子（发表评论）
const handleReply = async () => {
  if (!replyContent.value.trim()) {
    ElMessage.warning('请输入评论内容')
    return
  }

  try {
    console.log('发表评论, postId:', postId.value, 'content:', replyContent.value)
    await PostDetailApi.replyPost(postId.value, replyContent.value.trim())
    ElMessage.success('评论成功')
    replyContent.value = ''
    // 刷新评论列表和统计信息
    await Promise.all([
      getComments(),
      getPostStats()
    ])
  } catch (error) {
    console.error('评论失败:', error)
    ElMessage.error('评论失败')
  }
}

// 加载帖子内容
const loadPostContent = async () => {
  if (!postDetail.value?.contentFilePath) return
  
  try {
    console.log('postDetail:', postDetail.value)
    console.log('加载帖子内容文件:', postDetail.value.contentFilePath)
    const response = await fetch(postDetail.value.contentFilePath)
    if (!response.ok) throw new Error('加载内容失败')
    const html = await response.text()
    contentHtml.value = html
  } catch (error) {
    console.error('加载帖子内容失败:', error)
    ElMessage.error('加载帖子内容失败')
  }
}

// 获取评论列表
const getComments = async () => {
  if (!postId.value) return
  
  try {
    commentsLoading.value = true
    const response = await PostDetailApi.getComments(postId.value)
    console.log('获取评论响应:', response)
    // 直接使用response，因为request已经解构过data了
    comments.value = response.records.map(comment => ({
      id: comment.id,
      content: comment.content,
      username: comment.commenterName,
      userAvatar: comment.commenterAvatar,
      createTime: comment.creationTime,
      likeCount: comment.likeCount,
      isLiked: comment.isLiked,
      replyCount: comment.replyCount,
      children: [], // 子评论列表
      childrenLoading: false, // 子评论加载状态
      showChildren: true, // 默认显示子评论
      hasMoreChildren: false, // 是否有更多子评论
      currentPage: 1 // 当前页码
    }))

    // 自动加载有回复的评论的子评论
    const commentsWithReplies = comments.value.filter(comment => comment.replyCount > 0)
    if (commentsWithReplies.length > 0) {
      console.log('开始加载子评论，评论数:', commentsWithReplies.length)
      // 使用 Promise.all 并行加载所有子评论
      const loadPromises = commentsWithReplies.map(comment => {
        console.log('加载评论的子评论, commentId:', comment.id)
        return loadCommentChildren(comment)
      })
      await Promise.all(loadPromises)
      console.log('子评论加载完成')
    }
  } catch (error) {
    console.error('获取评论列表失败:', error)
    ElMessage.error('获取评论列表失败')
  } finally {
    commentsLoading.value = false
  }
}

// 加载子评论
const loadCommentChildren = async (comment) => {
  if (comment.childrenLoading) return

  try {
    comment.childrenLoading = true
    console.log('开始加载子评论, commentId:', comment.id)
    const response = await PostDetailApi.getCommentChildren(comment.id, comment.currentPage)
    console.log('获取子评论响应:', response)
    
    // 处理子评论数据
    const newChildren = response.records.map(child => ({
      id: child.id,
      content: child.content,
      username: child.commenterName,
      userAvatar: child.commenterAvatar,
      createTime: child.creationTime,
      likeCount: child.likeCount,
      isLiked: child.isLiked,
      replyCount: child.replyCount,
      parentCommentId: child.parentCommentId,
      replyToCommenterId: child.replyToCommenterId,
      replyToCommenterName: child.replyToCommenterName,
      isPublic: child.isPublic,
      reviewStatus: child.reviewStatus
    }))

    // 第一页直接替换，其他页追加
    if (comment.currentPage === 1) {
      comment.children = newChildren
    } else {
      comment.children.push(...newChildren)
    }

    // 更新分页信息
    comment.hasMoreChildren = response.total > comment.children.length
    comment.showChildren = true
    console.log('子评论加载完成, commentId:', comment.id, '子评论数:', newChildren.length)
  } catch (error) {
    console.error('获取子评论失败:', error)
    ElMessage.error('获取子评论失败')
  } finally {
    comment.childrenLoading = false
  }
}

// 加载更多子评论
const loadMoreChildren = async (comment) => {
  comment.currentPage++
  await loadCommentChildren(comment)
}

// 点赞帖子
const handleLike = async () => {
  try {
    console.log('点赞/取消点赞帖子, postId:', postId.value)
    await PostDetailApi.likePost(postId.value)
    // 更新点赞状态
    isLiked.value = !isLiked.value
    ElMessage.success(isLiked.value ? '点赞成功' : '已取消点赞')
    // 刷新统计信息
    getPostStats()
  } catch (error) {
    console.error('操作失败:', error)
    ElMessage.error('操作失败')
  }
}

// 获取收藏夹列表
const getFolders = async (page = 1) => {
  foldersLoading.value = true
  try {
    const response = await PersonalFavoriteApi.getFolderList({
      current: page,
      size: folderPageSize.value
    })
    if (response?.records) {
      folders.value = response.records.filter(folder => !folder.isDeleted)
      totalFolders.value = response.total || 0
    }
  } catch (error) {
    console.error('获取收藏夹列表失败:', error)
    ElMessage.error('获取收藏夹列表失败')
  } finally {
    foldersLoading.value = false
  }
}

// 获取收藏列表
const getFavoriteList = async (folderId, page = 1) => {
  if (!folderId) return
  
  favoriteListLoading.value = true
  try {
    const response = await PersonalFavoriteApi.getFavoriteList(folderId, {
      current: page,
      size: favoritePageSize.value
    })
    if (response?.records) {
      // 获取每个收藏项对应的帖子详情
      const postDetailsPromises = response.records.map(async (record) => {
        try {
          const postDetail = await PostDetailApi.getPostDetail(record.postId)
          return {
            ...record,
            post: postDetail
          }
        } catch (error) {
          console.error('获取帖子详情失败:', error)
          return {
            ...record,
            post: {
              title: '获取帖子失败',
              content: ''
            }
          }
        }
      })
      
      favoriteList.value = await Promise.all(postDetailsPromises)
      totalFavorites.value = response.total || 0
    }
  } catch (error) {
    console.error('获取收藏列表失败:', error)
    ElMessage.error('获取收藏列表失败')
  } finally {
    favoriteListLoading.value = false
  }
}

// 处理收藏夹选择
const handleFolderSelect = async (folderId) => {
  selectedFolder.value = folderId
  currentFavoritePage.value = 1
  await getFavoriteList(folderId)
}

// 处理收藏列表分页变化
const handleFavoritePageChange = (page) => {
  currentFavoritePage.value = page
  getFavoriteList(selectedFolder.value, page)
}

// 添加获取当前收藏夹ID的函数
const getCurrentFolderId = async () => {
  try {
    // 获取所有收藏夹
    const foldersResponse = await PersonalFavoriteApi.getFolderList({
      current: 1,
      size: 999 // 获取所有收藏夹
    })
    
    if (foldersResponse?.records) {
      // 遍历每个收藏夹检查帖子是否已收藏
      for (const folder of foldersResponse.records) {
        const favoritesResponse = await PersonalFavoriteApi.getFavoriteList(folder.id, {
          current: 1,
          size: 999 // 获取所有收藏
        })
        
        if (favoritesResponse?.records) {
          // 检查当前帖子是否在收藏列表中
          const favorite = favoritesResponse.records.find(item => item.postId === postId.value)
          if (favorite) {
            return folder.id // 找到收藏记录后返回收藏夹ID
          }
        }
      }
    }
    return null
  } catch (error) {
    console.error('获取当前收藏夹ID失败:', error)
    return null
  }
}

// 修改收藏按钮的处理函数
const handleCollect = async () => {
  if (isCollected.value) {
    // 如果已收藏，则取消收藏
    ElMessageBox.confirm(
      '确定要取消收藏该帖子吗？',
      '提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
    ).then(async () => {
      try {
        // 先获取当前收藏夹ID
        const folderId = await getCurrentFolderId()
        if (!folderId) {
          throw new Error('未找到收藏记录')
        }
        // 传入收藏夹ID进行取消收藏
        await PostDetailApi.favoritePost(postId.value, folderId)
        ElMessage.success('已取消收藏')
        isCollected.value = false
        // 刷新统计信息
        getPostStats()
      } catch (error) {
        console.error('取消收藏失败:', error)
        ElMessage.error('取消收藏失败')
      }
    }).catch(() => {
      // 取消操作，不做任何处理
    })
  } else {
    // 如果未收藏，显示收藏对话框
    showFavoriteDialog.value = true
    await getFolders()
  }
}

// 确认收藏
const handleFavorite = async () => {
  if (!selectedFolder.value) {
    ElMessage.warning('请选择收藏夹')
    return
  }
  
  try {
    await PostDetailApi.favoritePost(postId.value, selectedFolder.value)
    ElMessage.success('收藏成功')
    showFavoriteDialog.value = false
    selectedFolder.value = null
    // 更新收藏状态
    isCollected.value = true
    // 刷新统计信息
    getPostStats()
  } catch (error) {
    console.error('收藏失败:', error)
    ElMessage.error('收藏失败')
  }
}

// 点赞评论
const handleLikeComment = async (comment) => {
  try {
    console.log('点赞评论, commentId:', comment.id)
    const response = await PostDetailApi.likeComment(comment.id)
    console.log('点赞评论响应:', response)
    ElMessage.success('点赞成功')
    // 更新评论的点赞状态和数量
    comment.isLiked = !comment.isLiked
    comment.likeCount += comment.isLiked ? 1 : -1
  } catch (error) {
    console.error('点赞评论失败:', error)
    ElMessage.error('点赞评论失败')
  }
}

// 回复评论
const handleReplyComment = async (comment) => {
  comment.showReplyInput = !comment.showReplyInput
}

// 提交评论回复
const submitReply = async (comment) => {
  if (!comment.replyContent?.trim()) {
    ElMessage.warning('请输入回复内容')
    return
  }

  try {
    console.log('回复评论, commentId:', comment.id, 'content:', comment.replyContent)
    const response = await PostDetailApi.replyComment(comment.id, comment.replyContent.trim())
    console.log('回复评论响应:', response)
    ElMessage.success('回复成功')
    // 清空回复内容并隐藏输入框
    comment.replyContent = ''
    comment.showReplyInput = false
    // 刷新评论列表
    await getComments()
  } catch (error) {
    console.error('回复评论失败:', error)
    ElMessage.error('回复评论失败')
  }
}

// 创建新收藏夹
const createNewFolder = async () => {
  if (!newFolderName.value.trim()) {
    ElMessage.warning('请输入收藏夹名称')
    return
  }

  createFolderLoading.value = true
  try {
    await PersonalFavoriteApi.createFolder({
      folderName: newFolderName.value.trim(),
      description: newFolderDescription.value.trim()
    })
    ElMessage.success('创建成功')
    showCreateFolderDialog.value = false
    // 重置表单
    newFolderName.value = ''
    newFolderDescription.value = ''
    // 刷新收藏夹列表
    await getFolders()
  } catch (error) {
    console.error('创建收藏夹失败:', error)
    ElMessage.error('创建收藏夹失败')
  } finally {
    createFolderLoading.value = false
  }
}

// 添加跳转到用户主页的方法
const goToUserProfile = (userId) => {
  if (!userId) return
  router.push(`/user/${userId}`)
}

// 初始化
onMounted(async () => {
  console.log('PostDetailView mounted, route params:', route.params)
  postId.value = parseInt(route.params.id)
  if (!postId.value) {
    console.error('无效的帖子ID:', route.params.id)
    ElMessage.error('无效的帖子ID')
    return
  }

  try {
    loading.value = true
    console.log('开始加载帖子数据...')
    // 只在页面加载时记录一次浏览
    await recordView()
    await Promise.all([
      getPostDetail(),
      getPostStats(),
      getComments(),
      getReportTypes() // 加载举报类型
    ])
    console.log('帖子数据加载完成')
  } catch (error) {
    console.error('加载帖子数据失败:', error)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="post-detail">
    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <el-skeleton :rows="10" animated />
    </div>


    <!-- 帖子内容 -->
    <template v-else-if="postDetail">
      <div class="post-header">
      <h1>{{ postDetail.title }}</h1>
      <div class="post-meta">
        <div class="author-info">
          <el-avatar 
            :size="40" 
            :src="postDetail.authorAvatar || '/images/default-avatar.png'"
            class="author-avatar"
            @click="goToUserProfile(postDetail.authorId)"
            style="cursor: pointer;"
          />
          <div class="author-details">
            <span 
              class="author-name" 
              @click="goToUserProfile(postDetail.authorId)"
              style="cursor: pointer;"
            >
              {{ postDetail.authorName }}
            </span>
            <span class="post-time">{{ new Date(postDetail.createTime).toLocaleString() }}</span>
          </div>
        </div>
      </div>
    </div>

      <div class="post-content">
        <div v-if="postDetail.content" class="content-text">
          {{ postDetail.content }}
        </div>
        <div v-else-if="postDetail.contentFilePath" class="content-html" v-html="contentHtml"></div>
      </div>

      <!-- 标签 -->
      <div class="post-tags" v-if="postDetail.tags && postDetail.tags.length > 0">
        <el-tag
          v-for="tag in postDetail.tags"
          :key="tag"
          size="small"
          effect="light"
          class="tag"
        >
          {{ tag }}
        </el-tag>
      </div>

      <!-- 统计信息 -->
      <div class="post-stats" v-if="postStats">
        <div class="stats-item">
          <span>浏览</span>
          <strong>{{ postStats.viewCount }}</strong>
        </div>
        <div class="stats-item">
          <span>点赞</span>
          <strong>{{ postStats.likeCount }}</strong>
        </div>
        <div class="stats-item">
          <span>评论</span>
          <strong>{{ postStats.commentCount }}</strong>
        </div>
        <div class="stats-item">
          <span>分享</span>
          <strong>{{ postStats.shareCount }}</strong>
        </div>
      </div>

      <!-- 操作按钮 -->
      <div class="post-actions">
        <el-button 
          :type="isLiked ? 'primary' : 'default'"
          @click="handleLike" 
          :icon="Pointer"
          :class="{ 'is-liked': isLiked }"
        >
          {{ isLiked ? '已点赞' : '点赞' }}
        </el-button>
        <el-button 
          :type="isCollected ? 'warning' : 'default'"
          @click="handleCollect" 
          :icon="Star"
          :class="{ 'is-collected': isCollected }"
        >
          {{ isCollected ? '已收藏' : '收藏' }}
        </el-button>
        <el-button @click="handleShare" :icon="Share">
          分享
        </el-button>
        <el-button type="danger" @click="handleReport" :icon="Warning">
          举报
        </el-button>
      </div>

      <!-- 评论区 -->
      <div class="comments-section">
        <h3 class="comments-title">评论区</h3>
        
        <!-- 评论编辑框 -->
        <div class="comment-editor">
          <el-input
            v-model="replyContent"
            type="textarea"
            :rows="4"
            placeholder="写下你的评论..."
            resize="none"
            maxlength="1000"
            show-word-limit
          />
          <div class="editor-footer">
            <el-button 
              type="primary" 
              @click="handleReply"
              :disabled="!replyContent.trim()"
            >
              发表评论
            </el-button>
          </div>
        </div>
        
        <!-- 评论列表加载状态 -->
        <div v-if="commentsLoading" class="comments-loading">
          <el-skeleton :rows="3" animated />
        </div>
        
        <!-- 评论列表 -->
        <div v-else-if="comments.length > 0" class="comments-list">
          <div v-for="comment in comments" :key="comment.id" class="comment-item">
            <div class="comment-header">
              <div class="comment-user">
                <el-avatar 
                  :size="32" 
                  :src="comment.userAvatar || '/images/default-avatar.png'"
                />
                <span class="username">{{ comment.username }}</span>
              </div>
              <span class="comment-time">{{ new Date(comment.createTime).toLocaleString() }}</span>
            </div>
            <div class="comment-content">{{ comment.content }}</div>
            <div class="comment-actions">
              <div 
                class="action-item" 
                @click="handleLikeComment(comment)"
                :class="{ 'is-active': comment.isLiked }"
              >
                <el-icon><Pointer /></el-icon>
                <span>{{ comment.likeCount }}</span>
              </div>
              <div 
                class="action-item"
                @click="handleReplyComment(comment)"
                :class="{ 'is-active': comment.showReplyInput }"
              >
                <el-icon><ChatRound /></el-icon>
                <span>回复</span>
              </div>
              <div 
                class="action-item"
                @click="handleReportComment(comment)"
              >
                <el-icon><Warning /></el-icon>
                <span>举报</span>
              </div>
              <!-- 显示子评论按钮 -->
              <div 
                v-if="comment.replyCount > 0"
                class="action-item"
                @click="loadCommentChildren(comment)"
                :class="{ 'is-active': comment.showChildren }"
              >
                <span>{{ comment.showChildren ? '收起回复' : `查看回复(${comment.replyCount})` }}</span>
              </div>
            </div>

            <!-- 子评论列表 -->
            <div v-if="comment.showChildren" class="children-comments">
              <!-- 子评论加载状态 -->
              <div v-if="comment.childrenLoading" class="children-loading">
                <el-skeleton :rows="2" animated />
              </div>
              <!-- 子评论列表 -->
              <div v-else class="children-list">
                <div v-for="child in comment.children" :key="child.id" class="child-comment">
                  <div class="comment-header">
                    <div class="comment-user">
                      <el-avatar 
                        :size="24" 
                        :src="child.userAvatar || '/images/default-avatar.png'"
                      />
                      <span class="username">{{ child.username }}</span>
                      <template v-if="child.replyToCommenterName">
                        <span class="reply-arrow">回复</span>
                        <span class="reply-to">@{{ child.replyToCommenterName }}</span>
                      </template>
                    </div>
                    <span class="comment-time">{{ new Date(child.createTime).toLocaleString() }}</span>
                  </div>
                  <div class="comment-content">{{ child.content }}</div>
                  <div class="comment-actions">
                    <div 
                      class="action-item" 
                      @click="handleLikeComment(child)"
                      :class="{ 'is-active': child.isLiked }"
                    >
                      <el-icon><Pointer /></el-icon>
                      <span>{{ child.likeCount }}</span>
                    </div>
                    <div 
                      class="action-item"
                      @click="handleReplyComment(comment, child)"
                    >
                      <el-icon><ChatRound /></el-icon>
                      <span>回复</span>
                    </div>
                    <div 
                      class="action-item"
                      @click="handleReportComment(child)"
                    >
                      <el-icon><Warning /></el-icon>
                      <span>举报</span>
                    </div>
                  </div>
                </div>
                <!-- 加载更多按钮 -->
                <div 
                  v-if="comment.hasMoreChildren" 
                  class="load-more"
                  @click="loadMoreChildren(comment)"
                >
                  加载更多回复
                </div>
              </div>
            </div>

            <!-- 回复输入框 -->
            <div v-if="comment.showReplyInput" class="reply-editor">
              <el-input
                v-model="comment.replyContent"
                type="textarea"
                :rows="3"
                placeholder="写下你的回复..."
                resize="none"
                maxlength="500"
                show-word-limit
              />
              <div class="editor-footer">
                <el-button @click="comment.showReplyInput = false">取消</el-button>
                <el-button 
                  type="primary" 
                  @click="submitReply(comment)"
                  :disabled="!comment.replyContent?.trim()"
                >
                  发表回复
                </el-button>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 无评论提示 -->
        <el-empty 
          v-else 
          description="暂无评论" 
          :image-size="100"
        />
      </div>
    </template>

    <!-- 错误状态 -->
    <el-empty v-else description="帖子不存在或已被删除" />

    <!-- 举报对话框 -->
    <el-dialog
      v-model="showReportDialog"
      :title="reportDialogTitle"
      width="500px"
      :close-on-click-modal="false"
      class="report-dialog"
    >
      <div class="report-dialog-content">
        <div class="report-type-section">
          <div class="report-label">举报对象类型：</div>
          <div class="report-type-info">
            <span class="type-name">{{ reportedTypes.find(t => t.id === selectedReportedType)?.typeName }}</span>
            <el-tooltip
              :content="reportedTypes.find(t => t.id === selectedReportedType)?.typeDescription"
              placement="top"
            >
              <el-icon class="info-icon"><InfoFilled /></el-icon>
            </el-tooltip>
          </div>
        </div>
        <div class="report-type-section">
          <div class="report-label">举报类型：</div>
          <el-select
            v-model="selectedReportType"
            placeholder="请选择举报类型"
            class="report-type-select"
          >
            <el-option
              v-for="type in reportTypes.filter(t => t.isActive === 1)"
              :key="type.id"
              :label="type.typeName"
              :value="type.id"
            >
              <div class="report-option">
                <span class="option-name">{{ type.typeName }}</span>
                <el-tooltip
                  :content="type.typeDescription"
                  placement="right"
                  :show-after="200"
                >
                  <el-icon class="info-icon"><InfoFilled /></el-icon>
                </el-tooltip>
              </div>
            </el-option>
          </el-select>
        </div>
        <div class="report-reason-section">
          <div class="report-label">举报原因：</div>
          <el-input
            v-model="reportReason"
            type="textarea"
            :rows="4"
            placeholder="请详细描述举报原因（选填）"
            class="report-reason-input"
          />
        </div>
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showReportDialog = false">取消</el-button>
          <el-button type="primary" @click="submitReport">
            提交举报
          </el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 收藏对话框 -->
    <el-dialog
      v-model="showFavoriteDialog"
      title="收藏到"
      width="800px"
      :close-on-click-modal="false"
      class="favorite-dialog"
    >
      <div class="favorite-dialog-content">
        <div class="dialog-main">
          <!-- 左侧收藏夹列表 -->
          <div class="folder-section">
            <div class="folder-header">
              <span class="folder-title">我的收藏夹</span>
              <el-button
                type="primary"
                link
                @click="showCreateFolderDialog = true"
              >
                <el-icon><Plus /></el-icon>
                新建
              </el-button>
            </div>

            <el-skeleton :loading="foldersLoading" animated :rows="3" v-if="foldersLoading">
              <template #template>
                <div style="padding: 8px">
                  <el-skeleton-item variant="text" style="width: 100%; height: 32px; margin-bottom: 8px" />
                  <el-skeleton-item variant="text" style="width: 100%; height: 32px; margin-bottom: 8px" />
                  <el-skeleton-item variant="text" style="width: 100%; height: 32px" />
                </div>
              </template>
            </el-skeleton>

            <template v-else>
              <div v-if="folders.length > 0" class="folder-list">
                <div
                  v-for="folder in folders"
                  :key="folder.id"
                  class="folder-item"
                  :class="{ 'is-selected': selectedFolder === folder.id }"
                  @click="handleFolderSelect(folder.id)"
                >
                  <div class="folder-info">
                    <div class="folder-icon">
                      <el-icon><Star /></el-icon>
                    </div>
                    <div class="folder-details">
                      <span class="folder-name">{{ folder.folderName }}</span>
                      <span class="folder-count">{{ folder.favoriteCount || 0 }}个内容</span>
                    </div>
                  </div>
                </div>

                <el-pagination
                  v-if="totalFolders > folderPageSize"
                  :current-page="currentFolderPage"
                  :page-size="folderPageSize"
                  :total="totalFolders"
                  layout="prev, pager, next"
                  @current-change="handleFolderPageChange"
                  class="folder-pagination"
                  :pager-count="5"
                  small
                />
              </div>
              <el-empty v-else description="暂无收藏夹" />
            </template>
          </div>

          <!-- 右侧收藏列表 -->
          <div class="favorite-section" v-if="selectedFolder">
            <div class="favorite-list-header">收藏夹内容</div>
            <el-skeleton :loading="favoriteListLoading" animated :rows="3" v-if="favoriteListLoading">
              <template #template>
                <div style="padding: 8px">
                  <el-skeleton-item variant="text" style="width: 100%; height: 24px; margin-bottom: 8px" />
                  <el-skeleton-item variant="text" style="width: 100%; height: 24px; margin-bottom: 8px" />
                  <el-skeleton-item variant="text" style="width: 100%; height: 24px" />
                </div>
              </template>
            </el-skeleton>

            <template v-else>
              <div class="favorite-list">
                <div v-if="favoriteList.length > 0">
                  <div v-for="item in favoriteList" :key="item.id" class="favorite-item">
                    <div class="favorite-content">
                      <div class="favorite-title">{{ item.post?.title }}</div>
                      <div class="favorite-meta">
                        <span class="favorite-time">收藏于 {{ new Date(item.favoriteTime).toLocaleString() }}</span>
                      </div>
                    </div>
                  </div>
                  
                  <el-pagination
                    v-if="totalFavorites > favoritePageSize"
                    :current-page="currentFavoritePage"
                    :page-size="favoritePageSize"
                    :total="totalFavorites"
                    layout="prev, pager, next"
                    @current-change="handleFavoritePageChange"
                    class="favorite-pagination"
                    :pager-count="5"
                    small
                  />
                </div>
                <el-empty v-else description="暂无收藏内容" />
              </div>
            </template>
          </div>
        </div>
      </div>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showFavoriteDialog = false">取消</el-button>
          <el-button type="primary" @click="handleFavorite" :disabled="!selectedFolder">
            确定
          </el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 新建收藏夹对话框 -->
    <el-dialog
      v-model="showCreateFolderDialog"
      title="新建收藏夹"
      width="400px"
      :close-on-click-modal="false"
      append-to-body
      class="create-folder-dialog"
    >
      <div class="create-folder-content">
        <el-form label-position="top">
          <el-form-item label="收藏夹名称" required>
            <el-input
              v-model="newFolderName"
              placeholder="请输入收藏夹名称"
              maxlength="20"
              show-word-limit
            />
          </el-form-item>
          <el-form-item label="收藏夹描述">
            <el-input
              v-model="newFolderDescription"
              type="textarea"
              placeholder="请输入收藏夹描述"
              maxlength="100"
              show-word-limit
              :rows="3"
            />
          </el-form-item>
        </el-form>
      </div>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showCreateFolderDialog = false">取消</el-button>
          <el-button
            type="primary"
            @click="createNewFolder"
            :loading="createFolderLoading"
          >
            创建
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.post-detail {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px 40px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.loading-container {
  padding: 20px;
}

.post-header {
  margin-bottom: 32px;
}

.post-header {
  margin-bottom: 24px;
}

.post-meta {
  margin-top: 16px;
}

.author-info {
  margin-left: 12px;
  display: flex;
  align-items: center;
  gap: 12px;
}

.author-details {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.author-name {
  font-size: 16px;
  font-weight: 500;
  color: #303133;
}

.post-time {
  font-size: 14px;
  color: #909399;
}

.author-avatar {
  border: 1px solid #ebeef5;
  background-color: #f5f7fa;
}


.post-content {
  margin-bottom: 32px;
  line-height: 1.8;
  font-size: 16px;
}

.post-stats {
  display: flex;
  justify-content: space-around;
  padding: 16px;
  margin-bottom: 24px;
  background: #f5f7fa;
  border-radius: 8px;
}

.stats-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  cursor: pointer;
  padding: 8px 16px;
  border-radius: 4px;
  transition: all 0.3s;
}

.stats-item:hover {
  background: #e4e7ed;
}

.stats-item.is-liked {
  color: #409eff;
}

.stats-item.is-liked .el-icon {
  color: #409eff;
}

.stats-item span {
  font-size: 14px;
  color: #666;
}

.stats-item strong {
  font-size: 18px;
  color: #333;
}

.stats-item .el-icon {
  font-size: 20px;
  color: #666;
  margin-bottom: 4px;
}

.post-actions {
  display: flex;
  gap: 12px;
  justify-content: flex-end;
}

.post-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 16px;
}

.tag {
  font-size: 12px;
}

@media screen and (max-width: 768px) {
  .post-detail {
    padding: 12px;
    margin: 0 12px;
  }

  .post-header h1 {
    font-size: 24px;
    margin-bottom: 16px;
  }

  .post-meta {
    flex-direction: column;
    gap: 8px;
  }

  .post-stats {
    padding: 12px;
  }

  .post-actions {
    flex-wrap: wrap;
  }

  .post-content {
    font-size: 15px;
    margin-bottom: 24px;
  }

  .content-html {
    padding: 0;
  }
}

.content-text {
  white-space: pre-wrap;
  word-break: break-word;
}

.content-html {
  overflow-x: auto;
  padding: 0 20px;
}

.content-html :deep(img) {
  max-width: 100%;
  height: auto;
  margin: 16px 0;
  border-radius: 8px;
}

.content-html :deep(pre) {
  background: #f5f7fa;
  padding: 16px;
  border-radius: 4px;
  overflow-x: auto;
}

.content-html :deep(code) {
  font-family: Monaco, Consolas, Courier New, monospace;
}

.content-html :deep(table) {
  border-collapse: collapse;
  width: 100%;
  margin: 16px 0;
}

.content-html :deep(th),
.content-html :deep(td) {
  border: 1px solid #dcdfe6;
  padding: 8px;
}

.content-html :deep(th) {
  background: #f5f7fa;
}

/* 评论区样式 */
.comments-section {
  margin-top: 40px;
  padding-top: 24px;
  border-top: 1px solid #ebeef5;
}

.comment-button {
  margin-bottom: 24px;
}

.comments-title {
  font-size: 18px;
  font-weight: 600;
  color: #1a1a1a;
  margin: 0 0 24px;
}

.comments-loading {
  padding: 20px 0;
}

.comments-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.comment-item {
  padding: 16px;
  background: #f8f9fa;
  border-radius: 8px;
  transition: background-color 0.3s;
}

.comment-item:hover {
  background: #f0f2f5;
}

.comment-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.comment-user {
  display: flex;
  align-items: center;
  gap: 8px;
}

.username {
  font-weight: 500;
  color: #1a1a1a;
}

.comment-time {
  font-size: 12px;
  color: #909399;
}

.comment-content {
  font-size: 14px;
  line-height: 1.6;
  color: #333;
  white-space: pre-wrap;
  word-break: break-word;
}

@media screen and (max-width: 768px) {
  .comments-section {
    margin-top: 32px;
    padding-top: 20px;
  }

  .comments-title {
    font-size: 16px;
    margin-bottom: 20px;
  }

  .comment-item {
    padding: 12px;
  }

  .comment-header {
    margin-bottom: 8px;
  }

  .comment-content {
    font-size: 13px;
  }
}

/* 评论编辑器样式 */
.comment-editor {
  margin-bottom: 32px;
  background: #f8f9fa;
  border-radius: 8px;
  padding: 16px;
}

.comment-editor :deep(.el-textarea__inner) {
  background: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  padding: 12px;
  font-size: 14px;
  line-height: 1.6;
  resize: none;
}

.comment-editor :deep(.el-textarea__inner:focus) {
  border-color: #409eff;
}

.editor-footer {
  display: flex;
  justify-content: flex-end;
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid #e4e7ed;
}

@media screen and (max-width: 768px) {
  .comment-editor {
    margin-bottom: 24px;
    padding: 12px;
  }

  .comment-editor :deep(.el-textarea__inner) {
    padding: 8px;
    font-size: 13px;
  }

  .editor-footer {
    margin-top: 8px;
    padding-top: 8px;
  }
}

.post-actions .is-liked {
  background-color: #409eff;
  border-color: #409eff;
  color: #fff;
}

.post-actions .is-liked:hover {
  background-color: #66b1ff;
  border-color: #66b1ff;
  color: #fff;
}

.post-actions .is-collected {
  background-color: #e6a23c;
  border-color: #e6a23c;
  color: #fff;
}

.post-actions .is-collected:hover {
  background-color: #ebb563;
  border-color: #ebb563;
  color: #fff;
}

.comment-actions {
  display: flex;
  justify-content: flex-end;
  gap: 16px;
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid #ebeef5;
}

.action-item {
  display: flex;
  align-items: center;
  gap: 4px;
  padding: 4px 8px;
  border-radius: 4px;
  cursor: pointer;
  color: #666;
  transition: all 0.3s;
}

.action-item:hover {
  background: #f0f2f5;
}

.action-item.is-active {
  color: #409eff;
}

.action-item .el-icon {
  font-size: 16px;
}

.action-item span {
  font-size: 14px;
}

.reply-editor {
  margin-top: 12px;
  padding: 12px;
  background: #fff;
  border-radius: 4px;
  border: 1px solid #e4e7ed;
}

.reply-editor :deep(.el-textarea__inner) {
  background: #fff;
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  padding: 8px;
  font-size: 14px;
  line-height: 1.6;
  resize: none;
}

.reply-editor :deep(.el-textarea__inner:focus) {
  border-color: #409eff;
}

.reply-editor .editor-footer {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  margin-top: 8px;
  padding-top: 8px;
  border-top: 1px solid #e4e7ed;
}

@media screen and (max-width: 768px) {
  .reply-editor {
    margin-top: 8px;
    padding: 8px;
  }

  .reply-editor :deep(.el-textarea__inner) {
    padding: 6px;
    font-size: 13px;
  }

  .reply-editor .editor-footer {
    margin-top: 6px;
    padding-top: 6px;
  }
}

.children-comments {
  margin-top: 12px;
  padding: 12px;
  background: #fff;
  border-radius: 4px;
  border: 1px solid #e4e7ed;
}

.children-loading {
  padding: 12px;
}

.children-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.child-comment {
  padding: 12px;
  background: #f8f9fa;
  border-radius: 4px;
}

.child-comment .comment-header {
  margin-bottom: 8px;
}

.child-comment .comment-user {
  gap: 6px;
}

.child-comment .username {
  font-size: 13px;
}

.reply-to {
  color: #909399;
  font-size: 13px;
}

.child-comment .comment-content {
  font-size: 13px;
  margin-bottom: 8px;
}

.child-comment .comment-actions {
  margin-top: 8px;
  padding-top: 8px;
}

.load-more {
  text-align: center;
  color: #409eff;
  cursor: pointer;
  padding: 8px;
  font-size: 13px;
}

.load-more:hover {
  background: #f0f2f5;
  border-radius: 4px;
}

.reply-arrow {
  color: #909399;
  font-size: 13px;
  margin: 0 4px;
}

.reply-to {
  color: #409eff;
  font-size: 13px;
  cursor: pointer;
}

.reply-to:hover {
  text-decoration: underline;
}

/* 举报对话框样式 */
:deep(.report-dialog) {
  .el-message-box__header {
    padding-bottom: 20px;
    border-bottom: 1px solid #e4e7ed;
  }

  .el-message-box__content {
    padding: 20px;
  }

  .el-message-box__btns {
    padding: 20px;
    border-top: 1px solid #e4e7ed;
  }
}

.report-dialog-content {
  padding: 0 10px;
}

.report-type-section,
.report-reason-section {
  margin-bottom: 20px;
}

.report-label {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

:deep(.report-type-select) {
  width: 100%;
}

:deep(.report-reason-input) {
  .el-textarea__inner {
    resize: none;
  }
}

@media screen and (max-width: 768px) {
  :deep(.report-dialog) {
    width: 90% !important;
    
    .el-message-box__content {
      padding: 15px;
    }
    
    .el-message-box__btns {
      padding: 15px;
    }
  }
}

.report-type-info {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background: #f5f7fa;
  border-radius: 4px;
}

.type-name {
  font-size: 14px;
  color: #606266;
}

.info-icon {
  font-size: 16px;
  color: #909399;
  cursor: help;
}

/* 举报类型选项样式 */
.report-option {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding-right: 8px;
}

.option-name {
  flex: 1;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.report-option .info-icon {
  font-size: 14px;
  color: #909399;
  margin-left: 8px;
  flex-shrink: 0;
}

/* 收藏对话框样式 */
.favorite-dialog {
  :deep(.el-dialog__body) {
    padding: 0;
    max-height: 600px;
    overflow-y: auto;
  }

  :deep(.el-dialog__header) {
    margin: 0;
    padding: 16px;
    border-bottom: 1px solid #f0f0f0;
  }

  :deep(.el-dialog__footer) {
    margin: 0;
    padding: 12px 16px;
    border-top: 1px solid #f0f0f0;
  }
}

.favorite-dialog-content {
  height: 100%;
}

.dialog-main {
  display: flex;
  height: 100%;
}

.folder-section {
  width: 280px;
  border-right: 1px solid #f0f0f0;
  overflow-y: auto;
}

.favorite-section {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  background-color: #f5f7fa;
}

.favorite-list-header {
  padding: 12px 16px;
  font-size: 14px;
  font-weight: 500;
  color: #1f2329;
  border-bottom: 1px solid #f0f0f0;
  background-color: #fff;
}

.favorite-list {
  flex: 1;
  overflow-y: auto;
  padding: 8px 0;
}

.favorite-item {
  padding: 12px 16px;
  cursor: pointer;
  transition: all 0.2s ease;
  border-radius: 4px;
  margin: 0 8px;
  background-color: #fff;
  margin-bottom: 8px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}

.favorite-item:hover {
  background-color: #f8f9fa;
  transform: translateY(-1px);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.favorite-content {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.favorite-title {
  font-size: 14px;
  color: #1f2329;
  line-height: 1.5;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-weight: 500;
}

.favorite-meta {
  display: flex;
  align-items: center;
  gap: 12px;
}

.favorite-time {
  font-size: 12px;
  color: #86909c;
}

.favorite-pagination {
  margin-top: 8px;
  padding: 8px 0;
  display: flex;
  justify-content: center;
  background-color: #fff;
  border-top: 1px solid #f0f0f0;
}

@media screen and (max-width: 768px) {
  .dialog-main {
    flex-direction: column;
  }

  .folder-section {
    width: 100%;
    border-right: none;
    border-bottom: 1px solid #f0f0f0;
  }

  .favorite-section {
    max-height: 300px;
  }
  
  :deep(.favorite-dialog) {
    width: 90% !important;
  }
}

.folder-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  border-bottom: 1px solid #f0f0f0;
}

.folder-title {
  font-size: 14px;
  font-weight: 500;
  color: #1f2329;
}

.create-folder-dialog {
  :deep(.el-dialog__body) {
    padding: 20px;
  }
}

.create-folder-content {
  :deep(.el-form-item__label) {
    padding-bottom: 8px;
    font-weight: 500;
  }
}

@media screen and (max-width: 768px) {
  .folder-header {
    padding: 8px 12px;
  }
}

.folder-list {
  padding: 8px 0;
}

.folder-item {
  display: flex;
  align-items: center;
  padding: 8px 16px;
  cursor: pointer;
  transition: all 0.2s ease;
  border-radius: 4px;
  margin: 0 8px;
}

.folder-item:hover {
  background-color: #f5f7fa;
}

.folder-item.is-selected {
  background-color: #e6f2ff;
}

.folder-info {
  display: flex;
  align-items: center;
  gap: 12px;
  flex: 1;
  min-width: 0;
}

.folder-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  border-radius: 6px;
  background-color: #f0f7ff;
  color: #409eff;
  transition: all 0.2s ease;
}

.folder-item:hover .folder-icon {
  background-color: #e6f2ff;
}

.folder-item.is-selected .folder-icon {
  background-color: #409eff;
  color: #fff;
}

.folder-details {
  display: flex;
  flex-direction: column;
  gap: 2px;
  flex: 1;
  min-width: 0;
}

.folder-name {
  font-size: 14px;
  color: #1f2329;
  font-weight: 500;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.folder-count {
  font-size: 12px;
  color: #86909c;
}

.folder-pagination {
  padding: 8px 0;
  display: flex;
  justify-content: center;
  background-color: #fff;
  border-top: 1px solid #f0f0f0;
}

@media screen and (max-width: 768px) {
  .folder-item {
    padding: 8px 12px;
    margin: 0 4px;
  }
  
  .folder-icon {
    width: 28px;
    height: 28px;
  }
  
  .folder-name {
    font-size: 13px;
  }
  
  .folder-count {
    font-size: 11px;
  } 

}

</style>