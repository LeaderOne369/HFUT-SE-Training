<template>
  <div class="help-view">
    <div class="help-container">
      <h2 class="help-title">帮助中心</h2>
      <div class="help-content">
        <div class="help-section">
          <h3>常见问题</h3>
          <div class="qa-list">
            <div class="qa-item">
              <h4>如何发布文章？</h4>
              <p>点击顶部导航栏的"写文章"按钮，在编辑器中编写内容，完成后点击发布即可。</p>
            </div>
            <div class="qa-item">
              <h4>如何修改个人资料？</h4>
              <p>进入个人主页，点击"编辑资料"按钮，可以修改头像、简介等信息。</p>
            </div>
            <div class="qa-item">
              <h4>如何关注其他用户？</h4>
              <p>在用户的个人主页或文章页面点击"关注"按钮即可。</p>
            </div>
          </div>
        </div>
        <div class="help-section">
          <h3>使用指南</h3>
          <div class="guide-list">
            <div class="guide-item">
              <h4>新手入门</h4>
              <p>欢迎来到我们的平台！这里是一个知识分享和交流的社区，你可以浏览感兴趣的内容，也可以分享自己的见解。</p>
            </div>
            <div class="guide-item">
              <h4>内容发布规范</h4>
              <p>发布内容时请遵守相关法律法规，确保内容真实、原创，不得发布违法、侵权等不当信息。</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// 可以在这里添加需要的逻辑
</script>

<style scoped>
.help-view {
  width: 100%;
  min-height: 100vh;
  background-color: #f5f7fa;
  padding: 20px 0;
}

.help-container {
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  padding: 40px;
}

.help-title {
  text-align: center;
  color: #303133;
  margin-bottom: 30px;
  font-size: 24px;
}

.help-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.help-section {
  border-bottom: 1px solid #ebeef5;
  padding-bottom: 32px;
  margin-bottom: 32px;
}

.help-section:last-child {
  border-bottom: none;
  padding-bottom: 0;
  margin-bottom: 0;
}

.help-section h3 {
  color: #303133;
  margin-bottom: 24px;
  font-size: 20px;
}

.qa-list, .guide-list {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.qa-item, .guide-item {
  background-color: #f8f9fa;
  border-radius: 8px;
  padding: 24px;
}

.qa-item h4, .guide-item h4 {
  color: #409eff;
  margin: 0 0 12px 0;
  font-size: 16px;
}

.qa-item p, .guide-item p {
  color: #606266;
  margin: 0;
  line-height: 1.8;
  font-size: 14px;
}
</style> 