import request from '@/utils/request.js'

export default {
  // 获取评论详情
  getCommentDetail(commentId) {
    return request.get(`/api/client/personal/comment/${commentId}`)
  },

  // 获取已发布的评论
  getPublishedComments({ current, size }) {
    return request.get('/api/client/personal/comment/published', {
      params: {
        current,
        size
      }
    })
  },

  // 获取收到的评论
  getReceivedComments({ current, size }) {
    return request.get('/api/client/personal/comment/received', {
      params: {
        current,
        size
      }
    })
  },

  // 删除评论
  deleteComment(commentId) {
    return request.delete(`/api/client/personal/comment/${commentId}`)
  }
} 