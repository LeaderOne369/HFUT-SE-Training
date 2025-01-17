import request from '@/utils/request'

export default {
  // 发送验证码
  sendCaptcha(phone) {
    return request.post('/api/client/register/captcha', {
      phone
    })
  },

  // 注册
  register({ username, phone, email, password, code }) {
    return request.post('/api/client/register', {
      username,
      phone,
      email,
      password,
      code
    })
  }
} 