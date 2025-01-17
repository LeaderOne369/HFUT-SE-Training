<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import { useRouter } from 'vue-router'
import RegisterApi from '@/api/client/register-api'

const router = useRouter()
const registerFormRef = ref(null)
const loading = ref(false)
const countdown = ref(0)

const registerForm = ref({
  username: '',
  phone: '',
  email: '',
  password: '',
  confirmPassword: '',
  code: ''
})

const registerRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 2, max: 20, message: '用户名长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度在 6 到 20 个字符', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (value !== registerForm.value.password) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ],
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { pattern: /^\d{6}$/, message: '请输入6位数字验证码', trigger: 'blur' }
  ]
}

// 发送验证码
const handleSendCode = async () => {
  try {
    await registerFormRef.value.validateField('phone')
    const response = await RegisterApi.sendCaptcha(registerForm.value.phone)
    
    if (response?.code === 200) {
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

// 处理注册
const handleRegister = async () => {
  if (!registerFormRef.value) return
  
  try {
    await registerFormRef.value.validate()
    loading.value = true
    
    const response = await RegisterApi.register({
      username: registerForm.value.username,
      phone: registerForm.value.phone,
      email: registerForm.value.email,
      password: registerForm.value.password,
      code: registerForm.value.code
    })
    
    if (response?.code === 200) {
      ElMessage.success('注册成功')
      router.push('/login')
    }
  } catch (error) {
    console.error('注册失败:', error)
    ElMessage.error(error.response?.data?.msg || '注册失败')
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="register-container">
    <div class="register-content">
      <div class="register-box">
        <h2 class="title">注册账号</h2>
        
        <el-form 
          ref="registerFormRef" 
          :model="registerForm" 
          :rules="registerRules" 
          class="register-form"
        >
          <el-form-item prop="username">
            <el-input
              v-model="registerForm.username"
              placeholder="用户名"
            />
          </el-form-item>

          <el-form-item prop="phone">
            <div class="phone-input">
              <span class="country-code">中国 +86</span>
              <el-input 
                v-model="registerForm.phone" 
                placeholder="手机号"
                maxlength="11"
              />
            </div>
          </el-form-item>

          <el-form-item prop="email">
            <el-input
              v-model="registerForm.email"
              placeholder="邮箱"
            />
          </el-form-item>

          <el-form-item prop="password">
            <el-input
              v-model="registerForm.password"
              type="password"
              placeholder="密码"
              show-password
            />
          </el-form-item>

          <el-form-item prop="confirmPassword">
            <el-input
              v-model="registerForm.confirmPassword"
              type="password"
              placeholder="确认密码"
              show-password
            />
          </el-form-item>

          <el-form-item prop="code" class="code-input-group">
            <el-input
              v-model="registerForm.code"
              placeholder="输入 6 位验证码"
              maxlength="6"
            >
              <template #append>
                <el-button 
                  :disabled="!!countdown || !registerForm.phone" 
                  @click="handleSendCode"
                >
                  {{ countdown ? `${countdown}秒后重试` : '获取验证码' }}
                </el-button>
              </template>
            </el-input>
          </el-form-item>

          <div class="form-footer">
            <router-link to="/login" class="login-link">已有账号？立即登录</router-link>
          </div>

          <el-button 
            type="primary" 
            class="submit-btn" 
            @click="handleRegister" 
            :loading="loading"
          >
            注册
          </el-button>
        </el-form>
      </div>
    </div>
  </div>
</template>

<style scoped>
.register-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: url('@/assets/images/login-background3.png') center/cover no-repeat fixed;
  padding: 0;
  z-index: 100;
}

.register-content {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: flex-end;
  padding: 0 20px;
}

.register-box {
  width: 400px;
  background: rgba(255, 255, 255, 0.98);
  border-radius: 12px;
  padding: 40px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

.title {
  font-size: 24px;
  font-weight: 600;
  color: #1a1a1a;
  text-align: center;
  margin-bottom: 32px;
}

.register-form {
  margin-top: 32px;
}

.register-form :deep(.el-input__wrapper) {
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

.register-form :deep(.el-form-item__content) {
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
  justify-content: flex-end;
  margin: 24px 0;
}

.login-link {
  color: #175199;
  text-decoration: none;
  font-size: 14px;
}

.login-link:hover {
  color: #0d4b97;
}

.submit-btn {
  width: 100%;
  height: 48px;
  font-size: 16px;
  background: #056de8;
  border: none;
}

.submit-btn:hover {
  background: #0461cf;
}

@media screen and (max-width: 768px) {
  .register-content {
    justify-content: center;
  }

  .register-box {
    width: 100%;
    max-width: 400px;
  }
}
</style>