import request from '@/utils/request'

class PostDetailApi {
  // 获取帖子详细信息
  getPostDetail(postId) {
    return request({
      url: `/api/client/post-detail/${postId}`,
      method: 'get'
    })
  }

  // 获取帖子统计信息
  getPostStats(postId) {
    return request({
      url: `/api/client/post-detail/${postId}/stats`,
      method: 'get'
    })
  }

  // 浏览帖子
  viewPost(postId) {
    return request({
      url: `/api/client/post-detail/${postId}/view`,
      method: 'post'
    })
  }

  // 分享帖子
  sharePost(postId) {
    return request({
      url: `/api/client/post-detail/${postId}/share`,
      method: 'post'
    })
  }

  // 举报帖子
  reportPost(postId, reportTypeId, reason) {
    return request({
      url: `/api/client/post-detail/${postId}/report`,
      method: 'post',
      params: {
        reportTypeId,
        reason
      }
    })
  }

  // 回复帖子
  replyPost(postId, content) {
    return request({
      url: `/api/client/post-detail/${postId}/reply`,
      method: 'post',
      params: {
        content
      }
    })
  }

  // 获取评论列表
  getComments(postId) {
    return request({
      url: `/api/client/post-detail/${postId}/comments`,
      method: 'get'
    })
  }

  // 点赞帖子
  likePost(postId) {
    return request({
      url: `/api/client/post-detail/${postId}/like`,
      method: 'post'
    })
  }

  // 收藏帖子到收藏夹
  favoritePost(postId, folderId) {
    return request({
      url: `/api/client/post-detail/${postId}/favorite`,
      method: 'post',
      params: {
        folderId
      }
    })
  }

  // 点赞评论
  likeComment(commentId) {
    return request({
      url: `/api/client/post-detail/comments/${commentId}/like`,
      method: 'post'
    })
  }

  // 举报评论
  reportComment(commentId, reportTypeId, reason) {
    return request({
      url: `/api/client/comment/${commentId}/report`,
      method: 'post',
      params: {
        reportTypeId,
        reason
      }
    })
  }

  // 回复评论
  replyComment(commentId, content) {
    return request({
      url: `/api/client/comment/${commentId}/reply`,
      method: 'post',
      params: {
        content
      }
    })
  }

  // 获取评论的子评论
  getCommentChildren(commentId, current = 1, size = 10) {
    return request({
      url: `/api/client/post-detail/comments/${commentId}/children`,
      method: 'get',
      params: {
        current,
        size
      }
    })
  }

  // 获取举报对象类型列表
  getReportedTypes() {
    return request({
      url: '/api/client/post-detail/reported-types',
      method: 'get'
    })
  }

  // 获取举报类型列表
  getReportTypes() {
    return request({
      url: '/api/client/post-detail/report-types',
      method: 'get'
    })
  }
}

export default new PostDetailApi() 