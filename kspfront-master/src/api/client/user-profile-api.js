import request from '@/utils/request'

export default {
  // 获取用户基本信息
  getUserInfo(userId) {
    return request({
      url: `/api/system/user/${userId}`,
      method: 'get'
    })
  },

  // 获取用户的关注详情
  getFollowDetails(userId) {
    return request({
      url: `/api/client/personal/profile/${userId}/follow-details`,
      method: 'get'
    })
  },

  // 举报用户
  reportUser(userId, reportTypeId, reason) {
    return request({
      url: `/api/client/personal/profile/${userId}/report`,
      method: 'post',
      params: {
        reportTypeId,
        reason
      }
    })
  },

  // 关注用户
  followUser(followeeId) {
    return request({
      url: '/api/system/follow',
      method: 'post',
      data: {
        followeeId
      }
    })
  },

  // 获取用户帖子列表
  getUserPosts(userId) {
    return request({
      url: '/api/system/post/list',
      method: 'get',
      params: {
        userId
      }
    })
  }
} 