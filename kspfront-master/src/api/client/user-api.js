import request from '@/utils/request'

/**
 * 获取用户信息
 * @param {number} userId - 用户ID
 * @returns {Promise} 返回用户信息
 */
export function getUserInfo(userId) {
  return request({
    url: `/api/system/user/${userId}`,
    method: 'get'
  })
}

export default {
  getUserInfo
} 