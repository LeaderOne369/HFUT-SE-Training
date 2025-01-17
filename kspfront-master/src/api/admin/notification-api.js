import request from '@/utils/request'

export default {
  // 发送通知
  sendNotification(data) {
    return request.post('/system/notification/send', data)
  },

  // 获取用户通知列表
  getNotificationList(params) {
    return request.get('/system/notification/list', { params })
  },

  // 删除通知
  deleteNotification(id) {
    return request.delete(`/system/notification/delete/${id}`)
  }
} 