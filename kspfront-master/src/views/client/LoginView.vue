<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user'
import Token from '@/stores/token'
import LoginApi from '@/api/client/login-api'

const router = useRouter()
const userStore = useUserStore()
const loginFormRef = ref(null)
const loading = ref(false)
const loginType = ref('password')
const countdown = ref(0)
const rememberMe = ref(false)

const loginForm = ref({
  account: '',
  phone: '',
  password: '',
  code: ''
})

const loginRules = {
  account: [
    { required: true, message: '请输入账号', trigger: 'blur' }
  ],
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 2, max: 20, message: '密码长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { pattern: /^\d{6}$/, message: '请输入6位数字验证码', trigger: 'blur' }
  ]
}

// 发送验证码
const handleSendCode = async () => {
  try {
    await loginFormRef.value.validateField('phone')
    const response = await LoginApi.sendCaptcha(loginForm.value.phone)
    
    if (response?.data) {
      ElMessage.success('验证码发送成功')
      countdown.value = 60
      const timer = setInterval(() => {
        countdown.value--
        if (countdown.value <= 0) {
          clearInterval(timer)
        }
      }, 1000)
    }
  } catch (error) {
    console.error('发送验证码失败:', error)
    ElMessage.error('发送验证码失败')
  }
}

// 处理登录
const handleLogin = async () => {
  if (!loginFormRef.value) return
  
  try {
    await loginFormRef.value.validate()
    loading.value = true
    
    let response
    if (loginType.value === 'password') {
      response = await LoginApi.loginByUsername(loginForm.value.account, loginForm.value.password)
    } else {
      response = await LoginApi.loginByCaptcha(loginForm.value.phone, loginForm.value.code)
    }
    
    if (response) {
      const { token, user } = response
      Token.setToken(token)
      userStore.setUser(user)
      ElMessage.success('登录成功')
      await router.push('/home')
    } else {
      ElMessage.error('登录失败：响应数据格式错误')
    }
  } catch (error) {
    console.error('登录失败:', error)
    ElMessage.error(error.response?.data?.msg || '登录失败')
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="login-view">
    <div class="animated-background">
      <div class="line line1"></div>
      <div class="line line2"></div>
      <div class="line line3"></div>
      <div class="line line4"></div>
      <div class="line line5"></div>
    </div>
    <div class="login-container">
      <div class="login-content">
        <div class="login-box">
          <div class="login-tabs">
            <div class="tab-item" :class="{ active: loginType === 'password' }" @click="loginType = 'password'">
              密码登录
            </div>
            <div class="tab-item" :class="{ active: loginType === 'code' }" @click="loginType = 'code'">
              验证码登录
            </div>
          </div>

          <el-form ref="loginFormRef" :model="loginForm" :rules="loginRules" class="login-form">
            <!-- 账号输入框 -->
            <el-form-item v-if="loginType === 'password'" prop="account">
              <el-input
                v-model="loginForm.account"
                placeholder="用户名/手机号/邮箱"
              />
            </el-form-item>

            <!-- 手机号输入框 -->
            <el-form-item v-if="loginType === 'code'" prop="phone">
              <div class="phone-input">
                <span class="country-code">中国 +86</span>
                <el-input 
                  v-model="loginForm.phone" 
                  placeholder="手机号"
                  maxlength="11"
                />
              </div>
            </el-form-item>

            <!-- 密码登录 -->
            <el-form-item v-if="loginType === 'password'" prop="password">
              <el-input
                v-model="loginForm.password"
                type="password"
                placeholder="密码"
                show-password
              />
            </el-form-item>

            <!-- 验证码登录 -->
            <el-form-item v-else prop="code" class="code-input-group">
              <el-input
                v-model="loginForm.code"
                placeholder="输入 6 位验证码"
                maxlength="6"
              >
                <template #append>
                  <el-button 
                    :disabled="!!countdown || !loginForm.phone" 
                    @click="handleSendCode"
                  >
                    {{ countdown ? `${countdown}秒后重试` : '获取验证码' }}
                  </el-button>
                </template>
              </el-input>
            </el-form-item>

            <div class="form-footer">
              <el-checkbox v-model="rememberMe">记住我</el-checkbox>
              <router-link to="/register" class="register-link">注册账号</router-link>
            </div>

            <el-button type="primary" class="submit-btn" @click="handleLogin" :loading="loading">
              {{ loginType === 'password' ? '登录' : '注册/登录' }}
            </el-button>

            <div class="other-login">
              <div class="divider">
                <span>社交帐号登录</span>
              </div>
              <div class="social-icons">
                <img src="@/assets/icons/wechat.png" alt="微信" style="width: 32px; height: 28px;" />
                <img src="@/assets/icons/qq.png" alt="QQ" style="width: 28px; height: 32px; "  />
                <img src="@/assets/icons/weibo.png" alt="微博" style="width: 30px; height: 36px;" />
              </div>
            </div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.login-view {
  width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
  background: linear-gradient(135deg, #1a73e8 0%, #4285f4 50%, #3367d6 100%);
}

.animated-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: hidden;
  background: linear-gradient(135deg, #1a73e8 0%, #4285f4 50%, #3367d6 100%);
}

.line {
  position: absolute;
  width: 200vw;
  height: 3px;
  transform-origin: 0 0;
  /* box-shadow: 0 0 12px rgba(255, 255, 255, 0.4); */
}

.line1 {
  top: 15%;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 182, 193, 0.3));
  animation: moveLine1 12s infinite linear;
}

.line2 {
  top: 35%;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(135, 206, 250, 0.3));
  animation: moveLine2 15s infinite linear;
}

.line3 {
  top: 55%;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(152, 251, 152, 0.3));
  animation: moveLine3 18s infinite linear;
}

.line4 {
  top: 75%;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(255, 218, 185, 0.3));
  animation: moveLine4 14s infinite linear;
}

.line5 {
  top: 90%;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.2), rgba(230, 230, 250, 0.3));
  animation: moveLine5 16s infinite linear;
}

@keyframes moveLine1 {
  0% {
    transform: rotate(15deg) translateX(-100%);
  }
  100% {
    transform: rotate(15deg) translateX(0%);
  }
}

@keyframes moveLine2 {
  0% {
    transform: rotate(-12deg) translateX(-100%);
  }
  100% {
    transform: rotate(-12deg) translateX(0%);
  }
}

@keyframes moveLine3 {
  0% {
    transform: rotate(8deg) translateX(-100%);
  }
  100% {
    transform: rotate(8deg) translateX(0%);
  }
}

@keyframes moveLine4 {
  0% {
    transform: rotate(-10deg) translateX(-100%);
  }
  100% {
    transform: rotate(-10deg) translateX(0%);
  }
}

@keyframes moveLine5 {
  0% {
    transform: rotate(5deg) translateX(-100%);
  }
  100% {
    transform: rotate(5deg) translateX(0%);
  }
}

.login-container {
  position: relative;
  z-index: 1;
  width: 400px;
  padding: 0;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
}

.login-content {
  width: 100%;
  display: flex;
  justify-content: center;
}

.login-box {
  width: 100%;
  background: rgba(255, 255, 255, 0.98);
  border-radius: 12px;
  padding: 40px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

.login-tabs {
  display: flex;
  margin-bottom: 32px;
  border-bottom: 1px solid #f0f0f0;
}

.tab-item {
  flex: 1;
  text-align: center;
  padding: 16px 0;
  font-size: 16px;
  color: #8590a6;
  cursor: pointer;
  position: relative;
}

.tab-item.active {
  color: #1a1a1a;
  font-weight: 500;
}

.tab-item.active::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  width: 100%;
  height: 2px;
  background: #056de8;
}

.login-form {
  margin-top: 32px;
}

.login-form :deep(.el-input__wrapper) {
  height: 48px;
  line-height: 48px;
}

.phone-input {
  display: flex;
  align-items: center;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  overflow: hidden;
  width: 100%;
}

.phone-input:focus-within {
  border-color: #409eff;
}

.country-code {
  padding: 0 16px;
  height: 48px;
  line-height: 48px;
  color: #606266;
  background: #f5f7fa;
  border-right: 1px solid #dcdfe6;
  font-size: 14px;
  white-space: nowrap;
  min-width: 100px;
}

.phone-input :deep(.el-input) {
  flex: 1;
  width: 100%;
}

.phone-input :deep(.el-input__wrapper) {
  box-shadow: none !important;
  padding: 1px 11px;
  width: 100%;
}

.phone-input :deep(.el-input__inner) {
  border: none;
  padding-left: 8px;
  width: 100%;
}

.login-form :deep(.el-form-item__content) {
  display: flex;
  align-items: stretch;
  width: 100%;
}

.code-input-group :deep(.el-input-group__append) {
  padding: 0;
  background-color: transparent;
}

.code-input-group :deep(.el-input-group__append button) {
  height: 100%;
  margin: 0;
  border: none;
  padding: 0 15px;
  border-radius: 0;
}

.form-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 24px 0;
}

.register-link {
  color: #175199;
  text-decoration: none;
  font-size: 14px;
}

.register-link:hover {
  color: #0d4b97;
}

.submit-btn {
  width: 100%;
  height: 48px;
  font-size: 16px;
  background: #056de8;
  border: none;
  margin-top: 24px;
}

.submit-btn:hover {
  background: #0461cf;
}

.other-login {
  margin-top: 32px;
}

.divider {
  display: flex;
  align-items: center;
  color: #8590a6;
  font-size: 14px;
  margin: 16px 0;
}

.divider::before,
.divider::after {
  content: '';
  flex: 1;
  height: 1px;
  background: #f0f0f0;
}

.divider span {
  padding: 0 12px;
}

.social-icons {
  display: flex;
  justify-content: center;
  gap: 24px;
  margin-top: 16px;
}

.social-icons img {
  width: 28px;
  height: 28px;
  cursor: pointer;
  opacity: 0.8;
  transition: opacity 0.3s;
}

.social-icons img:hover {
  opacity: 1;
}

@media screen and (max-width: 768px) {
  .login-container,
  .login-box {
    width: 90%;
    max-width: 400px;
  }
}
</style>