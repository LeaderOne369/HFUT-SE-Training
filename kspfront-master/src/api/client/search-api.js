import request from '@/utils/request'
import Token from '@/stores/token'

export default {
  // 获取搜索历史
  async getSearchHistory() {
    try {
      const token = Token.getToken()
      console.log(token)
      const response = await fetch('https://jg85768183.vicp.fun/api/client/search/searchHistory', {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'token': token 
        }
      })
      const data = await response.json()
      if (data) {
        return data || []
      }
      return []
    } catch (error) {
      console.error('获取搜索历史失败:', error)
      return []
    }
  },

  // ES全文搜索帖子
  async searchPostsByES({ keyword, page = 1, size = 10 }) {
    try {
      const token = Token.getToken()
      const response = await fetch(`https://jg85768183.vicp.fun/api/client/search/es/posts?keyword=${encodeURIComponent(keyword)}&page=${page}&size=${size}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'token': token
        }
      })
      
      // 检查响应状态
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`)
      }
      
      // 获取响应文本并清理无效的JSON格式
      let responseText = await response.text()
      
      // 修复citation字段的格式问题
      responseText = responseText
        .replace(/"citation":,/g, '"citation":null,')  // 处理空值
        .replace(/"citation":([^,}\]]+)(,|}|\]])/g, (match, value, delimiter) => {
          // 如果值不是null且没有被引号包裹，则添加引号
          if (value.trim() !== 'null' && !value.trim().startsWith('"')) {
            return `"citation":"${value.trim()}"${delimiter}`
          }
          return match
        })
      
      // 尝试解析JSON
      let data
      try {
        data = JSON.parse(responseText)
      } catch (parseError) {
        console.error('JSON解析错误:', parseError)
        console.error('原始响应:', responseText)
        return {
          records: [],
          total: 0
        }
      }

      // 验证数据结构
      if (data && data.code === 200 && data.data) {
        return {
          records: Array.isArray(data.data.hits) ? data.data.hits : [],
          total: typeof data.data.total === 'number' ? data.data.total : 0
        }
      }
      
      return {
        records: [],
        total: 0
      }
    } catch (error) {
      console.error('ES搜索失败:', error)
      return {
        records: [],
        total: 0
      }
    }
  },

  // 根据关键词搜索帖子
  async searchPosts({ keyword, current = 1, size = 10 }) {
    try {
      const token = Token.getToken()
      const response = await fetch(`https://jg85768183.vicp.fun/api/client/search/searchByKeyword?keyword=${encodeURIComponent(keyword)}&current=${current}&size=${size}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'token': token
        }
      })
      const data = await response.json()
      if (data) {
        return data
      }
      return null
    } catch (error) {
      console.error('搜索失败:', error)
      return null
    }
  }
} 
