<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user.js'
import Token from '@/stores/token.js'
import { ElMessage } from 'element-plus'
import { User, Lock } from '@element-plus/icons-vue'
import request from '@/utils/request.js'

const router = useRouter()
const userStore = useUserStore()
const message = ElMessage

const loginForm = reactive({
  username: '',
  password: ''
})

const loading = ref(false)
const loginFormRef = ref(null)

const rules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '用户名长度应在3-20个字符之间', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度应在6-20个字符之间', trigger: 'blur' }
  ]
}

const handleLogin = async () => {
  if (!loginFormRef.value) return
  
  try {
    await loginFormRef.value.validate()
    
    loading.value = true
    const response = await request.post('/api/admin/login', loginForm)
    
    // 检查响应数据
    if (response.user && response.token) {
      // 保存token和用户信息
      Token.setToken(response.token)
      userStore.setUser(response.user)
      
      // 先显示消息
      await message.success('登录成功')
      // 等待一下再跳转
      setTimeout(() => {
        router.push('/admin/dashboard')
      }, 500)
    } else {
      message.error('登录失败，响应数据不完整')
    }
  } catch (error) {
    console.error('登录错误:', error)
    if (error.response?.data?.msg) {
      message.error(error.response.data.msg)
    } else {
      message.error('登录失败，请重试')
    }
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="admin-login-view">
    <div class="background-pattern">
      <div class="pattern-left"></div>
      <div class="pattern-right"></div>
    </div>
    <div class="geometric-shapes">
      <div class="shape shape1"></div>
      <div class="shape shape2"></div>
      <div class="shape shape3"></div>
    </div>
    <div class="login-container">
      <div class="login-header">
        <h1 class="login-title">知识分享平台管理端</h1>
        <p class="login-subtitle">请登录您的账号</p>
      </div>
      
      <el-form
        ref="loginFormRef"
        :model="loginForm"
        :rules="rules"
        class="login-form"
        @keyup.enter="handleLogin"
      >
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            placeholder="用户名"
            :prefix-icon="User"
            size="large"
          />
        </el-form-item>
        
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            placeholder="密码"
            :prefix-icon="Lock"
            size="large"
            show-password
          />
        </el-form-item>
        
        <el-form-item>
          <el-button
            type="primary"
            :loading="loading"
            class="submit-btn"
            size="large"
            @click="handleLogin"
          >
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
.admin-login-view {
  width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.background-pattern {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 0;
}

.pattern-left {
  position: absolute;
  top: 0;
  left: 0;
  width: 50%;
  height: 100%;
  background: #2c3e50;
  clip-path: polygon(0 0, 100% 0, 85% 100%, 0% 100%);
}

.pattern-right {
  position: absolute;
  top: 0;
  right: 0;
  width: 50%;
  height: 100%;
  background: #34495e;
  clip-path: polygon(15% 0, 100% 0, 100% 100%, 0% 100%);
}

.geometric-shapes {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.1;
}

.shape {
  position: absolute;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 4px;
}

.shape1 {
  width: 100px;
  height: 100px;
  top: 10%;
  left: 20%;
  transform: rotate(45deg);
  animation: float1 20s infinite linear;
}

.shape2 {
  width: 150px;
  height: 150px;
  top: 60%;
  right: 15%;
  transform: rotate(30deg);
  animation: float2 25s infinite linear;
}

.shape3 {
  width: 80px;
  height: 80px;
  bottom: 20%;
  left: 30%;
  transform: rotate(60deg);
  animation: float3 22s infinite linear;
}

@keyframes float1 {
  0% { transform: rotate(45deg) translate(0, 0); }
  50% { transform: rotate(60deg) translate(20px, 20px); }
  100% { transform: rotate(45deg) translate(0, 0); }
}

@keyframes float2 {
  0% { transform: rotate(30deg) translate(0, 0); }
  50% { transform: rotate(45deg) translate(-20px, 20px); }
  100% { transform: rotate(30deg) translate(0, 0); }
}

@keyframes float3 {
  0% { transform: rotate(60deg) translate(0, 0); }
  50% { transform: rotate(75deg) translate(20px, -20px); }
  100% { transform: rotate(60deg) translate(0, 0); }
}

.login-container {
  position: relative;
  z-index: 1;
  width: 400px;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 12px;
  padding: 40px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.login-header {
  text-align: center;
  margin-bottom: 40px;
}

.login-title {
  font-size: 24px;
  color: #2c3e50;
  font-weight: 600;
  margin-bottom: 8px;
}

.login-subtitle {
  font-size: 14px;
  color: #7f8c8d;
}

.login-form {
  margin-top: 20px;
}

.login-form :deep(.el-input__wrapper) {
  height: 48px;
  line-height: 48px;
  background: rgba(255, 255, 255, 0.8);
}

.submit-btn {
  width: 100%;
  height: 48px;
  font-size: 16px;
  margin-top: 24px;
  background: linear-gradient(135deg, #2c3e50, #34495e);
  border: none;
  transition: all 0.3s ease;
}

.submit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

@media screen and (max-width: 768px) {
  .login-container {
    width: 90%;
    max-width: 400px;
    padding: 30px;
  }
}
</style>