import request from '@/utils/request.js'
import Token from '@/stores/token.js'

export default {
  // 获取我的帖子列表
  getPostList() {
    return request({
      url: '/api/client/personal/post/list',
      method: 'get'
    })
  },

  // 获取帖子详情
  getPostDetail(postId) {
    return request({
      url: `/api/client/personal/post/${postId}`,
      method: 'get'
    })
  },

  // 更新帖子
  updatePost(postData) {
    const postId = new URLSearchParams(window.location.search).get('id')
    return request({
      url: '/api/client/personal/post',
      method: 'put',
      data: postData,
      params: {
        postId: postId
      },
      headers: {
        'Content-Type': 'application/json'
      }
    })
  },

  // 删除帖子
  deletePost(postId) {
    return request({
      url: `/api/client/personal/post/${postId}`,
      method: 'delete'
    })
  },

  // 上传封面
  uploadCover(formData) {
    return request({
      url: '/api/file/cover',
      method: 'post',
      data: formData,
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  },

  // 上传内容图片
  uploadContentImage(formData) {
    return request({
      url: '/api/file/content',
      method: 'post',
      data: formData,
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  },

  // 保存帖子
  savePost(postData) {
    return request({
      url: '/api/client/post/publish/save',
      method: 'post',
      data: postData,
      headers: {
        'Content-Type': 'application/json'
      }
    })
  },

  // 获取分区列表
  getSections() {
    return request({
      url: '/api/client/post/publish/sections',
      method: 'get'
    })
  },

  // 获取分区标签列表
  getSectionTags(sectionId) {
    return request({
      url: `/api/client/post/publish/sections/${sectionId}/tags`,
      method: 'get'
    })
  },

  // 获取合集列表
  getCollections() {
    return request({
      url: '/api/client/post/publish/collections',
      method: 'get'
    })
  },

  // 发布帖子
 publishPost(postData) {
    return request({
      url: '/api/client/post/publish/publish',
      method: 'post',
      data: postData,
      headers: {
        'Content-Type': 'application/json'
      }
    })
  },

  // 上传内容文件
  uploadContentFile(formData) {
    return request({
      url: '/api/file/content',
      method: 'post',
      data: formData,
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  }
} 