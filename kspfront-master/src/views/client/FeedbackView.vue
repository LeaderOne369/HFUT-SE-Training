<template>
  <div class="feedback-view">
    <div class="feedback-container">
      <h2 class="feedback-title">意见反馈</h2>
      <div class="feedback-content">
        <div class="feedback-form">
          <el-form :model="feedbackForm" label-position="top" :rules="rules" ref="formRef">
            <el-form-item label="反馈类型" prop="type">
              <el-select v-model="feedbackForm.type" placeholder="请选择反馈类型">
                <el-option label="功能建议" value="feature" />
                <el-option label="问题反馈" value="bug" />
                <el-option label="内容建议" value="content" />
                <el-option label="其他" value="other" />
              </el-select>
            </el-form-item>
            <el-form-item label="标题" prop="title">
              <el-input v-model="feedbackForm.title" placeholder="请输入标题" />
            </el-form-item>
            <el-form-item label="内容描述" prop="content">
              <el-input
                v-model="feedbackForm.content"
                type="textarea"
                :rows="6"
                placeholder="请详细描述您的意见或建议"
              />
            </el-form-item>
            <el-form-item label="联系方式" prop="contact">
              <el-input v-model="feedbackForm.contact" placeholder="请留下您的联系方式（选填）" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitFeedback" :loading="submitting">
                提交反馈
              </el-button>
            </el-form-item>
          </el-form>
        </div>
        <div class="feedback-tips">
          <h3>温馨提示</h3>
          <ul>
            <li>请尽可能详细地描述您的问题或建议</li>
            <li>如果是功能问题，请说明问题发生的步骤</li>
            <li>如果方便的话，可以留下您的联系方式，以便我们及时回复</li>
            <li>我们会认真对待每一条反馈，感谢您的支持</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import type { FormInstance } from 'element-plus'
import feedbackApi from '@/api/client/feedback-api'

const formRef = ref<FormInstance>()
const submitting = ref(false)

const feedbackForm = ref({
  type: '',
  title: '',
  content: '',
  contact: ''
})

const rules = {
  type: [{ required: true, message: '请选择反馈类型', trigger: 'change' }],
  title: [{ required: true, message: '请输入标题', trigger: 'blur' }],
  content: [{ required: true, message: '请输入内容描述', trigger: 'blur' }]
}

const submitFeedback = async () => {
  if (!formRef.value) return
  
  try {
    await formRef.value.validate()
    submitting.value = true
    
    // 构造反馈内容
    const feedbackContent = `
类型：${feedbackForm.value.type}
标题：${feedbackForm.value.title}
内容：${feedbackForm.value.content}
联系方式：${feedbackForm.value.contact || '未提供'}
    `.trim()
    
    // 调用提交接口
    await feedbackApi.submitFeedback(feedbackContent)
    
    ElMessage.success('感谢您的反馈，我们会认真处理')
    // 重置表单
    feedbackForm.value = {
      type: '',
      title: '',
      content: '',
      contact: ''
    }
    formRef.value.resetFields()
  } catch (error) {
    console.error('提交反馈失败:', error)
    ElMessage.error('提交反馈失败，请稍后重试')
  } finally {
    submitting.value = false
  }
}
</script>

<style scoped>
.feedback-view {
  width: 100%;
  min-height: 100vh;
  background-color: #f5f7fa;
  padding: 20px 0;
}

.feedback-container {
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  padding: 40px;
}

.feedback-title {
  text-align: center;
  color: #303133;
  margin-bottom: 40px;
  font-size: 24px;
}

.feedback-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 40px;
}

.feedback-form {
  padding-right: 40px;
  border-right: 1px solid #ebeef5;
}

.feedback-tips {
  padding: 24px;
  background-color: #f8f9fa;
  border-radius: 8px;
}

.feedback-tips h3 {
  color: #303133;
  margin: 0 0 16px 0;
  font-size: 16px;
}

.feedback-tips ul {
  margin: 0;
  padding-left: 20px;
  color: #606266;
  font-size: 14px;
  line-height: 1.8;
}

.feedback-tips li {
  margin-bottom: 12px;
}

.feedback-tips li:last-child {
  margin-bottom: 0;
}

:deep(.el-form-item__label) {
  font-weight: 500;
  padding-bottom: 8px;
  font-size: 14px;
}

:deep(.el-input__wrapper) {
  box-shadow: 0 0 0 1px #dcdfe6 inset;
  padding: 4px 12px;
}

:deep(.el-input__wrapper:hover) {
  box-shadow: 0 0 0 1px #c0c4cc inset;
}

:deep(.el-textarea__inner) {
  box-shadow: 0 0 0 1px #dcdfe6 inset;
  padding: 12px;
  font-size: 14px;
  line-height: 1.6;
}

:deep(.el-textarea__inner:hover) {
  box-shadow: 0 0 0 1px #c0c4cc inset;
}

:deep(.el-form-item) {
  margin-bottom: 24px;
}

:deep(.el-button) {
  padding: 12px 24px;
  font-size: 14px;
  min-width: 120px;
}

@media screen and (max-width: 768px) {
  .feedback-content {
    grid-template-columns: 1fr;
  }
  
  .feedback-form {
    padding-right: 0;
    border-right: none;
    border-bottom: 1px solid #ebeef5;
    padding-bottom: 40px;
  }
}
</style> 