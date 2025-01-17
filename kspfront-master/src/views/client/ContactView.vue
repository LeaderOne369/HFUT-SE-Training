<template>
  <div class="contact-view">
    <div class="contact-container">
      <h2 class="contact-title">联系我们</h2>
      <div class="contact-content">
        <div class="contact-section">
          <h3>联系方式</h3>
          <div class="contact-info">
            <div class="info-item">
              <h4>客服邮箱</h4>
              <p>support@example.com</p>
            </div>
            <div class="info-item">
              <h4>工作时间</h4>
              <p>周一至周五 9:00-18:00</p>
            </div>
          </div>
        </div>
        <div class="contact-section">
          <h3>意见反馈</h3>
          <div class="feedback-form">
            <el-form :model="feedbackForm" label-position="top">
              <el-form-item label="反馈类型">
                <el-select v-model="feedbackForm.type" placeholder="请选择反馈类型">
                  <el-option label="功能建议" value="feature" />
                  <el-option label="问题反馈" value="bug" />
                  <el-option label="其他" value="other" />
                </el-select>
              </el-form-item>
              <el-form-item label="标题">
                <el-input v-model="feedbackForm.title" placeholder="请输入标题" />
              </el-form-item>
              <el-form-item label="内容描述">
                <el-input
                  v-model="feedbackForm.content"
                  type="textarea"
                  :rows="4"
                  placeholder="请详细描述您的意见或建议"
                />
              </el-form-item>
              <el-form-item label="联系方式">
                <el-input v-model="feedbackForm.contact" placeholder="请留下您的联系方式（选填）" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitFeedback">提交反馈</el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { ElMessage } from 'element-plus'

const feedbackForm = ref({
  type: '',
  title: '',
  content: '',
  contact: ''
})

const submitFeedback = () => {
  // 这里添加提交反馈的逻辑
  if (!feedbackForm.value.type || !feedbackForm.value.title || !feedbackForm.value.content) {
    ElMessage.warning('请填写必要的反馈信息')
    return
  }
  
  ElMessage.success('感谢您的反馈，我们会认真处理')
  // 重置表单
  feedbackForm.value = {
    type: '',
    title: '',
    content: '',
    contact: ''
  }
}
</script>

<style scoped>
.contact-view {
  width: 100%;
  min-height: 100vh;
  background-color: #f5f7fa;
  padding: 20px 0;
}

.contact-container {
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  padding: 40px;
}

.contact-title {
  text-align: center;
  color: #303133;
  margin-bottom: 30px;
  font-size: 24px;
}

.contact-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.contact-section {
  border-bottom: 1px solid #ebeef5;
  padding-bottom: 32px;
  margin-bottom: 32px;
}

.contact-section:last-child {
  border-bottom: none;
  padding-bottom: 0;
  margin-bottom: 0;
}

.contact-section h3 {
  color: #303133;
  margin-bottom: 24px;
  font-size: 20px;
}

.contact-info {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 24px;
}

.info-item {
  background-color: #f8f9fa;
  border-radius: 8px;
  padding: 24px;
}

.info-item h4 {
  color: #409eff;
  margin: 0 0 12px 0;
  font-size: 16px;
}

.info-item p {
  color: #606266;
  margin: 0;
  line-height: 1.8;
  font-size: 14px;
}

.feedback-form {
  max-width: 800px;
  margin: 0 auto;
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
  padding: 8px 12px;
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
}
</style> 