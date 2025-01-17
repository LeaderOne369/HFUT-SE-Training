<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'
import { ElMessage } from 'element-plus'
import { Document, Edit, Position } from '@element-plus/icons-vue'
import AiApi from '@/api/client/ai-api.js'
import { useUserStore } from "@/stores/user.js"

const userStore = useUserStore()
const defaultAvatar = 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
const aiAvatar = new URL('@/assets/images/ai2.png', import.meta.url).href

// 客户端ID
const clientId = ref('')
// 对话记录
const messages = ref([])
// 输入框内容
const inputMessage = ref('')
// 加载状态
const loading = ref(false)
// 用户活动总结
const userSummary = ref('')
// 写作对话框
const writeDialogVisible = ref(false)
// 写作表单
const writeForm = ref({
  title: '',
  description: '',
  existingContent: '',
  outputFormat: 'md',
  writingStyle: '正式',
  targetWordCount: 1000
})

// 写作风格选项
const styleOptions = [
  { label: '正式', value: '正式' },
  { label: '轻松', value: '轻松' },
  { label: '专业', value: '专业' }
]

// 输出格式选项
const formatOptions = [
  { label: 'Markdown', value: 'md' },
  { label: '纯文本', value: 'txt' }
]

// 建立连接
const connect = async () => {
  try {
    const response = await AiApi.connectChat()
    if (response?.clientId) {
      clientId.value = response.clientId
      // 添加欢迎消息
      messages.value.push({
        role: 'assistant',
        content: '您好！我是您的AI助手，有什么我可以帮您的吗？'
      })
    }
  } catch (error) {
    console.error('连接失败:', error)
    ElMessage.error('连接失败')
  }
}

// 获取用户活动总结
const getUserSummary = async () => {
  loading.value = true
  try {
    const response = await AiApi.getUserSummary()
    if (response) {
      messages.value.push({
        role: 'assistant',
        content: '根据您的活动记录，以下是您的个性化总结：\n' + response
      })
    }
  } catch (error) {
    console.error('获取用户总结失败:', error)
    ElMessage.error('获取用户总结失败')
  } finally {
    loading.value = false
  }
}

// 处理AI响应内容
const processAiResponse = (response) => {
  if (!response) return ''
  
  // 提取回答部分
  const answerMatch = response.match(/- 回答：([\s\S]*?)(?=\n\s*-|$)/)
  if (answerMatch && answerMatch[1]) {
    return answerMatch[1].trim()
  }
  
  // 如果没有匹配到标准格式，返回原始内容
  return response
}

// 发送消息
const sendMessage = async () => {
  if (!inputMessage.value.trim() || !clientId.value) return
  
  // 添加用户消息到对话记录
  messages.value.push({
    role: 'user',
    content: inputMessage.value
  })
  
  const message = inputMessage.value
  inputMessage.value = ''
  loading.value = true
  
  try {
    const response = await AiApi.sendMessage(clientId.value, message)
    if (response) {
      messages.value.push({
        role: 'assistant',
        content: processAiResponse(response)
      })
    }
  } catch (error) {
    console.error('发送消息失败:', error)
    ElMessage.error('发送消息失败')
  } finally {
    loading.value = false
  }
}

// AI写作
const writeArticle = async () => {
  if (!writeForm.value.title) {
    ElMessage.warning('请输入文章标题')
    return
  }
  
  loading.value = true
  try {
    const response = await AiApi.writeArticle(writeForm.value)
    if (response) {
      messages.value.push({
        role: 'assistant',
        content: processAiResponse(response)
      })
      writeDialogVisible.value = false
    }
  } catch (error) {
    console.error('生成文章失败:', error)
    ElMessage.error('生成文章失败')
  } finally {
    loading.value = false
  }
}

// 关闭连接
const closeConnection = async () => {
  if (clientId.value) {
    try {
      await AiApi.closeConnection(clientId.value)
    } catch (error) {
      console.error('关闭连接失败:', error)
    }
  }
}

onMounted(() => {
  connect()
})

onBeforeUnmount(() => {
  closeConnection()
})
</script>

<template>
  <div class="ai-assistant">
    <!-- 对话区域 -->
    <div class="chat-container">
      <div class="messages" ref="messagesRef">
        <div
          v-for="(message, index) in messages"
          :key="index"
          :class="['message', message.role]"
        >
          <div class="avatar">
            <el-avatar 
              :size="40" 
              :src="message.role === 'user' ? (userStore.user?.avatar || defaultAvatar) : aiAvatar"
            />
          </div>
          <div class="message-content markdown-body">
            <pre v-if="message.role === 'user'">{{ message.content }}</pre>
            <div v-else class="markdown-content">{{ message.content }}</div>
          </div>
        </div>
      </div>
      
      <div class="input-area">
        <div class="input-wrapper">
          <el-input
            v-model="inputMessage"
            type="textarea"
            :rows="3"
            placeholder="输入您的问题..."
            :disabled="loading"
            @keyup.enter.ctrl="sendMessage"
            resize="none"
          />
          <div class="input-tip">按 Ctrl + Enter 发送</div>
        </div>
        <div class="button-group">
          <div class="left-buttons">
            <el-button
              type="info"
              :loading="loading"
              @click="getUserSummary"
              size="large"
              plain
            >
              <el-icon><Document /></el-icon>
              获取我的总结
            </el-button>
            <el-button
              type="success"
              @click="writeDialogVisible = true"
              size="large"
              plain
            >
              <el-icon><Edit /></el-icon>
              AI写作
            </el-button>
          </div>
          <el-button
            type="primary"
            :loading="loading"
            @click="sendMessage"
            size="large"
          >
            <el-icon><Position /></el-icon>
            发送
          </el-button>
        </div>
      </div>
    </div>

    <!-- 写作对话框 -->
    <el-dialog
      v-model="writeDialogVisible"
      title="AI写作助手"
      width="600px"
      destroy-on-close
    >
      <el-form :model="writeForm" label-width="100px">
        <el-form-item label="文章标题" required>
          <el-input v-model="writeForm.title" placeholder="请输入文章标题" />
        </el-form-item>
        
        <el-form-item label="文章简述">
          <el-input
            v-model="writeForm.description"
            type="textarea"
            :rows="3"
            placeholder="请输入文章简述"
            resize="none"
          />
        </el-form-item>
        
        <el-form-item label="已有内容">
          <el-input
            v-model="writeForm.existingContent"
            type="textarea"
            :rows="5"
            placeholder="如果已经写了一部分内容，可以粘贴在这里"
            resize="none"
          />
        </el-form-item>
        
        <el-form-item label="输出格式" required>
          <el-radio-group v-model="writeForm.outputFormat">
            <el-radio
              v-for="item in formatOptions"
              :key="item.value"
              :label="item.value"
            >
              {{ item.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        
        <el-form-item label="写作风格">
          <el-select v-model="writeForm.writingStyle" placeholder="请选择写作风格">
            <el-option
              v-for="item in styleOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        
        <el-form-item label="期望字数">
          <el-input-number
            v-model="writeForm.targetWordCount"
            :min="100"
            :max="5000"
            :step="100"
          />
        </el-form-item>
      </el-form>
      
      <template #footer>
        <el-button @click="writeDialogVisible = false" size="large">取消</el-button>
        <el-button
          type="primary"
          :loading="loading"
          @click="writeArticle"
          size="large"
        >
          开始生成
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.ai-assistant {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  width: 100%;
  box-sizing: border-box;
  height: calc(100vh - 80px);
}

.chat-container {
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.messages {
  flex: 1;
  padding: 24px;
  overflow-y: auto;
  background-color: #f5f7fa;
}

.message {
  margin-bottom: 20px;
  display: flex;
  position: relative;
  animation: fadeIn 0.3s ease-in-out;
  gap: 12px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.message.user {
  flex-direction: row-reverse;
}

.message.assistant {
  flex-direction: row;
}

.avatar {
  flex-shrink: 0;
}

.message-content {
  max-width: calc(80% - 52px);
  padding: 12px 16px;
  border-radius: 12px;
  font-size: 14px;
  line-height: 1.6;
  white-space: pre-wrap;
  position: relative;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.message.assistant .message-content {
  background-color: #fff;
  color: #333;
  border-top-left-radius: 4px;
  margin-left: 0;
  position: relative;
}

.message.assistant .message-content::before {
  content: '';
  position: absolute;
  left: -8px;
  top: 15px;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 8px 8px 8px 0;
  border-color: transparent #fff transparent transparent;
}

.message.user .message-content {
  background-color: #95ec69;
  color: #333;
  border-top-right-radius: 4px;
  margin-right: 0;
  position: relative;
}

.message.user .message-content::before {
  content: '';
  position: absolute;
  right: -8px;
  top: 15px;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 8px 0 8px 8px;
  border-color: transparent transparent transparent #95ec69;
}

.message-content :deep(h3) {
  margin: 16px 0 12px;
  font-size: 18px;
  font-weight: 600;
  color: #333;
}

.message-content :deep(p) {
  margin: 8px 0;
}

.message-content :deep(ul) {
  margin: 8px 0;
  padding-left: 20px;
}

.message-content :deep(li) {
  margin: 4px 0;
}

.message-content :deep(strong) {
  font-weight: 600;
  color: #333;
}

.message.assistant .message-content {
  background-color: #fff;
  color: #333;
  border-top-left-radius: 4px;
  margin-left: 12px;
}

.message.user .message-content {
  background-color: #95ec69;
  color: #333;
  border-top-right-radius: 4px;
  margin-right: 12px;
}

.message.user .message-content :deep(h3),
.message.user .message-content :deep(strong) {
  color: #2c3e50;
}

.input-area {
  padding: 20px;
  background-color: #fff;
  border-top: 1px solid #ebeef5;
}

.input-wrapper {
  position: relative;
  margin-bottom: 16px;
}

.input-wrapper :deep(.el-textarea__inner) {
  resize: none;
  border-radius: 8px;
  padding: 12px;
  font-size: 14px;
  line-height: 1.6;
  border-color: #dcdfe6;
  transition: all 0.3s;
}

.input-wrapper :deep(.el-textarea__inner:focus) {
  border-color: #409eff;
  box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.1);
}

.input-tip {
  position: absolute;
  right: 12px;
  bottom: 8px;
  font-size: 12px;
  color: #909399;
  background: rgba(255, 255, 255, 0.9);
  padding: 2px 8px;
  border-radius: 4px;
}

.button-group {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.left-buttons {
  display: flex;
  gap: 12px;
}

.button-group :deep(.el-button) {
  padding: 12px 20px;
  display: flex;
  align-items: center;
  gap: 6px;
}

.button-group :deep(.el-icon) {
  margin-right: 4px;
}

@media screen and (max-width: 768px) {
  .ai-assistant {
    padding: 12px;
    height: calc(100vh - 60px);
  }
  
  .message-content {
    max-width: 90%;
  }
  
  .button-group {
    flex-direction: column;
    gap: 12px;
  }
  
  .left-buttons {
    width: 100%;
  }
  
  .button-group :deep(.el-button) {
    width: 100%;
    justify-content: center;
  }
}

.markdown-body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
}

.markdown-content {
  line-height: 1.6;
}

.markdown-content h3 {
  margin: 16px 0 12px;
  font-size: 18px;
  font-weight: 600;
  color: #333;
}

.markdown-content p {
  margin: 8px 0;
}

.markdown-content ul {
  margin: 8px 0;
  padding-left: 20px;
  list-style-type: disc;
}

.markdown-content li {
  margin: 4px 0;
}

.markdown-content strong {
  font-weight: 600;
  color: #333;
}

.message.user .markdown-content h3,
.message.user .markdown-content strong {
  color: #2c3e50;
}
</style> 