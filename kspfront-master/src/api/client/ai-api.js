import axios from 'axios'
import Token from '@/stores/token.js'

// 创建专门的AI接口axios实例
const aiRequest = axios.create({
  baseURL: 'https://jg85768183.vicp.fun',
  timeout: 60000 // AI请求可能需要更长的超时时间
})

// 请求拦截器
aiRequest.interceptors.request.use(
  config => {
    const token = Token.getToken()
    if (token) {
      config.headers['token'] = `${token}`
    }
    return config
  },
  error => {
    console.error('AI请求错误:', error)
    return Promise.reject(error)
  }
)

// AI接口不使用通用的响应拦截器，处理特定的响应格式
aiRequest.interceptors.response.use(
  response => {
    // 如果响应是标准格式，提取data字段
    if (response.data && typeof response.data === 'object' && 'code' in response.data) {
      if (response.data.code === 200) {
        return response.data.data
      }
      return Promise.reject(new Error(response.data.msg || '请求失败'))
    }
    // 如果不是标准格式，直接返回数据
    return response.data
  },
  error => Promise.reject(error)
)

export default {
  // 建立AI聊天连接
  connectChat() {
    return aiRequest.get('/api/client/ai/chat/connect')
  },

  // 获取用户活动总结
  getUserSummary() {
    return aiRequest.get('/api/client/ai/chat/summary')
  },

  // 发送消息(流式)
  sendStreamMessage(clientId, message) {
    return aiRequest.post(`/api/client/ai/chat/${clientId}`, {
      message
    })
  },

  // 发送消息(非流式)
  sendMessage(clientId, message) {
    return aiRequest.post(`/api/client/ai/chat/sync/${clientId}`, {
      message
    })
  },

  // 关闭连接
  closeConnection(clientId) {
    return aiRequest.delete(`/api/client/ai/chat/${clientId}`)
  },

  // AI写作
  writeArticle({
    title,
    description = '',
    existingContent = '',
    outputFormat = 'md',
    writingStyle = '正式',
    targetWordCount = 1000
  }) {
    return aiRequest.post('/api/client/ai/chat/write', {
      title,
      description,
      existingContent,
      outputFormat,
      writingStyle,
      targetWordCount
    })
  }
} 