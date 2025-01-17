import axios from 'axios'
import Token from '@/stores/token.js'
import { ElMessage } from 'element-plus'

// 创建axios实例
const request = axios.create({
  baseURL: 'https://jg85768183.vicp.fun', // API的base_url
  timeout: 30000, // 请求超时时间增加到30秒
  retries: 1, // 重试次数
  retryDelay: 1000 // 重试延迟时间（毫秒）
})

// 请求拦截器
request.interceptors.request.use(
  config => {
    // 在请求发送之前添加token
    const token = Token.getToken()
    if (token) {
      config.headers['token'] = `${token}`
    }
    // 添加重试配置
    config.retryCount = config.retryCount || 0
    
    console.log('发送请求:', {
      url: config.url,
      method: config.method,
      params: config.params,
      data: config.data,
      headers: config.headers
    })
    return config
  },
  error => {
    console.error('请求错误:', error)
    return Promise.reject(error)
  }
)

// 响应拦截器
request.interceptors.response.use(
  response => {
    console.log('收到响应:', {
      url: response.config.url,
      status: response.status,
      data: response.data
    })
    
    console.log('res:', response.data.code)

    const res = response.data
    // 如果返回的状态码不是200，说明出错了
    if (res.code !== 200) {
     
      console.error('请求失败:', {
        url: response.config.url,
        code: res.code,
        message: res.msg,
        data:res
      })
      
      // 对于未登录相关的错误码，不显示错误提示
      if (res.code === 401 || res.code === 403) {
        Token.clearToken()
        window.location.href = '/login'
        return Promise.reject(new Error(res.msg || '未登录'))
      }
      
      // ElMessage.error(res.msg || '请求失败')
      return Promise.reject(new Error(res.msg || '请求失败'))
    }
    return res.data
  },
  error => {
    const config = error.config

    // 如果是超时错误并且还有重试次数，则进行重试
    if (error.code === 'ECONNABORTED' && error.message.includes('timeout') &&
        config.retryCount < request.defaults.retries) {
      config.retryCount += 1
      console.log(`请求超时，第 ${config.retryCount} 次重试...`)
      
      // 创建新的Promise来处理重试
      return new Promise(resolve => {
        setTimeout(() => {
          console.log('重新发送请求')
          resolve(request(config))
        }, request.defaults.retryDelay)
      })
    }

    console.error('响应错误:', {
      url: error.config?.url,
      status: error.response?.status,
      message: error.response?.data?.msg,
      error
    })
    
    // 处理401未授权的情况
    if (error.response && (error.response.status === 401 || error.response.status === 403)) {
      Token.clearToken()
      window.location.href = '/login'
      return Promise.reject(error)
    }
    
    // 其他错误才显示错误提示
    ElMessage.error(error.response?.data?.msg || '请求失败')
    return Promise.reject(error)
  }
)

export default request 