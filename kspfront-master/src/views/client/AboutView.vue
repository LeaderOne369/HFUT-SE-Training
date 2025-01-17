<template>
  <div class="about-view">
    <div class="about-container">
      <h2 class="about-title">关于平台</h2>
      <div class="about-content">
        <div class="about-section">
          <h3>平台介绍</h3>
          <p>我们是一个专注于知识分享和交流的在线社区平台。在这里，你可以发现各个领域的精彩内容，与志同道合的人交流讨论，分享你的知识和见解。</p>
        </div>
        <div class="about-section">
          <h3>我们的使命</h3>
          <p>致力于打造一个高质量的知识分享平台，让知识传播更加便捷，让学习变得更加有趣。我们希望通过这个平台，连接更多的人，分享更多的知识。</p>
        </div>
        <div class="about-section">
          <h3>平台特色</h3>
          <div class="feature-list">
            <div class="feature-item">
              <h4>优质内容</h4>
              <p>严格的内容审核机制，确保平台内容的质量和可靠性。</p>
            </div>
            <div class="feature-item">
              <h4>互动交流</h4>
              <p>支持评论、点赞、收藏等多种互动方式，促进用户之间的交流。</p>
            </div>
            <div class="feature-item">
              <h4>个性化推荐</h4>
              <p>基于用户兴趣的智能推荐系统，帮助用户发现感兴趣的内容。</p>
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
.about-view {
  width: 100%;
  min-height: 100vh;
  background-color: #f5f7fa;
  padding: 20px 0;
}

.about-container {
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  padding: 40px;
}

.about-title {
  text-align: center;
  color: #303133;
  margin-bottom: 30px;
  font-size: 24px;
}

.about-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.about-section {
  border-bottom: 1px solid #ebeef5;
  padding-bottom: 32px;
  margin-bottom: 32px;
}

.about-section:last-child {
  border-bottom: none;
  padding-bottom: 0;
  margin-bottom: 0;
}

.about-section h3 {
  color: #303133;
  margin-bottom: 24px;
  font-size: 20px;
}

.about-section p {
  color: #606266;
  line-height: 1.8;
  margin: 0;
  font-size: 14px;
}

.feature-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 24px;
}

.feature-item {
  background-color: #f8f9fa;
  border-radius: 8px;
  padding: 24px;
}

.feature-item h4 {
  color: #409eff;
  margin: 0 0 12px 0;
  font-size: 16px;
}

.feature-item p {
  color: #606266;
  margin: 0;
  line-height: 1.8;
  font-size: 14px;
}
</style> 