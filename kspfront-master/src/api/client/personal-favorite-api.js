import request from '@/utils/request'

class PersonalFavoriteApi {
  // 获取收藏夹列表
  getFolderList() {
    return request({
      url: '/api/client/personal/favorite/folder/list',
      method: 'get'
    })
  }

  // 获取收藏列表
  getFavoriteList(folderId, params) {
    return request({
      url: `/api/client/personal/favorite/list/${folderId}`,
      method: 'get',
      params
    })
  }

  // 创建收藏夹
  createFolder(data) {
    return request({
      url: '/api/client/personal/favorite/folder',
      method: 'post',
      data
    })
  }

  // 更新收藏夹
  updateFolder(data) {
    return request({
      url: '/api/client/personal/favorite/folder',
      method: 'put',
      data
    })
  }

  // 删除收藏夹
  deleteFolder(folderId) {
    return request({
      url: `/api/client/personal/favorite/folder/${folderId}`,
      method: 'delete'
    })
  }

  // 移动收藏
  moveFavorite(favoriteId, targetFolderId) {
    return request({
      url: `/api/client/personal/favorite/move/${favoriteId}`,
      method: 'post',
      params: {
        targetFolderId
      }
    })
  }

  // 删除收藏
  deleteFavorite(favoriteId) {
    return request({
      url: `/api/client/personal/favorite/${favoriteId}`,
      method: 'delete'
    })
  }
}

export default new PersonalFavoriteApi() 