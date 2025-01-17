import request from '@/utils/request.js'

export default {
  // 获取收藏夹列表
  getFolderList() {
    return request.get('/api/client/personal/favorite/folder/list')
  },

  // 获取收藏列表
  getFavoriteList(folderId) {
    return request.get(`/api/client/personal/favorite/list/${folderId}`)
  },

  // 创建收藏夹
  createFolder(data) {
    return request.post('/api/client/personal/favorite/folder', data)
  },

  // 修改收藏夹
  updateFolder(data) {
    return request.put('/api/client/personal/favorite/folder', data)
  },

  // 删除收藏夹
  deleteFolder(folderId) {
    return request.delete(`/api/client/personal/favorite/folder/${folderId}`)
  },

  // 删除收藏
  deleteFavorite(favoriteId) {
    return request.delete(`/api/client/personal/favorite/${favoriteId}`)
  },

  // 移动收藏
  moveFavorite(favoriteId, data) {
    return request.post(`/api/client/personal/favorite/move/${favoriteId}`, data)
  }
} 