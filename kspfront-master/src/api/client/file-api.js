import request from '@/utils/request'

export default {
  // 上传图片
  uploadImage(file) {
    const formData = new FormData()
    formData.append('file', file)
    
    return request.post('/api/file/image', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  }
} 