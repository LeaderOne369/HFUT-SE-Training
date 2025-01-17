import request from '@/utils/request'

/**
 * 提交反馈
 * @param {string} feedbackContent - 反馈内容
 * @returns {Promise} 返回提交结果
 */
export function submitFeedback(feedbackContent) {
  return request({
    url: '/api/client/feedback/submit',
    method: 'post',
    data: {
      feedbackContent
    }
  })
}

/**
 * 获取用户反馈列表
 * @param {number} userId - 用户ID
 * @returns {Promise} 返回反馈列表
 */
export function getFeedbackList(userId) {
  return request({
    url: `/api/client/feedback/user/${userId}`,
    method: 'get'
  })
}

/**
 * 删除反馈
 * @param {number} id - 反馈ID
 * @returns {Promise} 返回删除结果
 */
export function deleteFeedback(id) {
  return request({
    url: `/api/client/feedback/${id}`,
    method: 'delete'
  })
}

export default {
  submitFeedback,
  getFeedbackList,
  deleteFeedback
} 