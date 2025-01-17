import request from '@/utils/request'

/**
 * 获取用户的所有通知
 * @param {number} userId - 用户ID
 * @param {Object} params - 查询参数
 * @param {number} [params.type] - 通知类型（可选）
 * @param {number} [params.current=1] - 当前页码
 * @param {number} [params.size=10] - 每页大小
 * @returns {Promise} 返回通知列表的Promise对象
 */
export function getUserNotifications(userId, params = {}) {
  return request({
    url: `/api/client/notification/user/${userId}/all`,
    method: 'get',
    params: {
      type: params.type,
      current: params.current || 1,
      size: params.size || 10
    }
  })
}

/**
 * 获取用户未读通知数量
 * @param {number} userId - 用户ID
 * @returns {Promise<number>} 返回未读通知数量
 */
export function getUnreadCount(userId) {
  return request({
    url: `/api/client/notification/user/${userId}/unreadCount`,
    method: 'get'
  })
}

/**
 * 标记指定通知为已读
 * @param {number} id - 通知ID
 * @returns {Promise} 返回标记结果
 */
export function markAsRead(id) {
  return request({
    url: `/api/client/notification/${id}/read`,
    method: 'put'
  })
}

/**
 * 标记用户所有通知为已读
 * @param {number} userId - 用户ID
 * @returns {Promise} 返回标记结果
 */
export function markAllAsRead(userId) {
  return request({
    url: `/api/client/notification/user/${userId}/markAllRead`,
    method: 'put'
  })
}

/**
 * 获取单条通知详情
 * @param {number} id - 通知ID
 * @returns {Promise} 返回通知详情
 */
export function getNotificationDetail(id) {
  return request({
    url: `/api/client/notification/${id}`,
    method: 'get'
  })
}

export default {
  getUserNotifications,
  getUnreadCount,
  markAsRead,
  markAllAsRead,
  getNotificationDetail
} 