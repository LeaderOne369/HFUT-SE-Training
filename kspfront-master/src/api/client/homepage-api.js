import axios from 'axios'

class HomepageApi {
  constructor() {
    this.baseURL = 'https://jg85768183.vicp.fun'
  }

  // 获取首页所有数据
  getHomepage() {
    return axios.get(`${this.baseURL}/api/client/homepage`)
  }

  // 获取用户简要信息
  getUserBrief() {
    return axios.get(`${this.baseURL}/api/client/homepage/user-brief`)
  }

  // 获取分区列表
  getSections() {
    return axios.get(`${this.baseURL}/api/client/homepage/sections`)
  }

  // 获取推荐内容
  getRecommend() {
    return axios.get(`${this.baseURL}/api/client/homepage/recommend`)
  }

  // 获取通知列表
  getNotifications() {
    return axios.get(`${this.baseURL}/api/client/homepage/notifications`)
  }
}

export default new HomepageApi() 