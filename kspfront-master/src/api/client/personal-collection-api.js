import request from '@/utils/request.js'

export default {
  // 更新合集
  updateCollection(data) {
    return request.put('/api/client/personal/collection', data)
  },

  // 获取合集详情
  getCollectionDetail(collectionId) {
    return request.get(`/api/client/personal/collection/${collectionId}`)
  },

  // 删除合集
  deleteCollection(collectionId) {
    return request.delete(`/api/client/personal/collection/${collectionId}`)
  },

  // 创建合集
  createCollection(data) {
    return request.put('/api/client/personal/collection/add', data)
  },

  // 获取我创建的合集列表
  getCreatedCollections() {
    return request.get('/api/client/personal/collection/created')
  },

  // 获取我订阅的合集列表
  getSubscribedCollections() {
    return request.get('/api/client/personal/collection/subscribed')
  },

  // 取消订阅合集
  unsubscribeCollection(collectionId) {
    return request.delete(`/api/client/personal/collection/subscription/${collectionId}`)
  }
} 