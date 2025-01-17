<script setup>
import '@wangeditor/editor/dist/css/style.css'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import { ref, shallowRef, onBeforeUnmount, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import PersonalPostApi from '@/api/client/personal-post-api.js'
import Token from '@/stores/token.js'
import FileApi from '@/api/client/file-api'
import { Plus, Upload, InfoFilled } from '@element-plus/icons-vue'

const route = useRoute()
const router = useRouter()

// 打印userId
const token = Token.getToken()
if (token) {
  const payload = JSON.parse(atob(token.split('.')[1]))
  console.log('当前用户ID:', payload.jti)
}

// 编辑器实例，必须用 shallowRef
const editorRef = shallowRef()
// 编辑器内容
const editorContent = ref('')

const postForm = ref({
  title: '',
  cover: '',
  summary: '',
  contentFileId: '',
  contentFilePath: '',
  sectionId: null,
  tags: '',
  collectionId: null,
  visibility: 0,
  citation: '',
  citationSource: '',
  content: ''
})

const toolbarConfig = {}
const editorConfig = {
  placeholder: '请输入内容...',
  MENU_CONF: {
    uploadImage: {
      async customUpload(file, insertFn) {
        try {
          console.log('上传图片:', file)
          const response = await FileApi.uploadImage(file)
          console.log('图片上传响应:', response)
          
          // 直接使用返回的 URL 字符串
          if (response) {
            insertFn(response)
          } else {
            throw new Error('图片上传失败：未获取到图片URL')
          }
        } catch (error) {
          console.error('图片上传失败:', error)
          ElMessage.error('图片上传失败')
        }
      }
    }
  }
}

// 监听编辑器内容变化
const handleEditorChange = (editor) => {
  postForm.value.content = editor.getHtml()
}

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})

// 分区列表
const sections = ref([])

// 获取分区列表
const getSections = async () => {
  try {
    console.log('获取分区列表')
    const response = await PersonalPostApi.getSections()
    console.log('分区列表响应:', response)
    if (response) {
      // 只显示未删除且公开的分区
      sections.value = response.filter(section => 
        section.isDeleted === 0 && section.visibility === 1
      )
    }
  } catch (error) {
    console.error('获取分区列表失败:', error)
    ElMessage.error('获取分区列表失败')
  }
}

// 合集列表
const collections = ref([])

// 获取合集列表
const getCollections = async () => {
  try {
    console.log('获取合集列表')
    const response = await PersonalPostApi.getCollections()
    console.log('合集列表响应:', response)
    if (response) {
      collections.value = response
    }
  } catch (error) {
    console.error('获取合集列表失败:', error)
    ElMessage.error('获取合集列表失败')
  }
}

// 添加加载内容的函数
const loadPostContent = async (contentFilePath) => {
  if (!contentFilePath) return
  
  try {
    console.log('加载帖子内容:', contentFilePath)
    const response = await fetch(contentFilePath)
    const content = await response.text()
    console.log('内容加载成功')
    return content
  } catch (error) {
    console.error('加载帖子内容失败:', error)
    ElMessage.error('加载帖子内容失败')
    return ''
  }
}

// 初始化帖子内容
const initPost = async () => {
  try {
    // 获取分区列表和合集列表
    await Promise.all([
      getSections(),
      getCollections()
    ])
    
    // 获取帖子详情（如果是编辑模式）
    const postId = route.query.id
    if (postId) {
      console.log('编辑模式，获取帖子详情:', postId)
      const response = await PersonalPostApi.getPostDetail(postId)
      console.log('帖子详情响应:', response)
      
      if (response) {
        // 设置表单数据
        postForm.value = {
          ...response,
          sectionId: response.sectionId || null,
          collectionId: response.collectionId || null,
          // 将数组转换为逗号分隔的字符串
          tags: response.tags ? response.tags.join(', ') : '',
          visibility: response.visibility || 0,
          contentFileId: response.contentFileId || '',
          contentFilePath: response.contentFilePath || ''
        }
        
        // 加载帖子内容
        if (response.contentFilePath) {
          const content = await loadPostContent(response.contentFilePath)
          postForm.value.content = content
          editorContent.value = content
        }
        
        console.log('设置表单数据:', postForm.value)

        // 如果有分区ID，获取分区标签
        if (postForm.value.sectionId) {
          console.log('获取分区标签:', postForm.value.sectionId)
          await getSectionTags(postForm.value.sectionId)
          // 直接使用返回的标签数组
          selectedTags.value = response.tags || []
          console.log('设置已选标签:', selectedTags.value)
        }
      }
    }
  } catch (error) {
    console.error('初始化失败:', error)
    ElMessage.error('初始化失败')
  }
}

// 分区标签列表
const sectionTags = ref([])
const selectedTags = ref([])

// 获取分区标签
const getSectionTags = async (sectionId) => {
  if (!sectionId) return
  
  try {
    console.log('获取分区标签列表, sectionId:', sectionId)
    const response = await PersonalPostApi.getSectionTags(sectionId)
    console.log('分区标签响应:', response)
    if (response) {
      sectionTags.value = response
    }
  } catch (error) {
    console.error('获取分区标签失败:', error)
    ElMessage.error('获取分区标签失败')
  }
}

// 监听分区变化
const handleSectionChange = async (sectionId) => {
  console.log('分区变化:', sectionId)
  // 如果不是编辑模式，或者切换了不同的分区，则清空已选标签
  if (!route.query.id || sectionId !== postForm.value.sectionId) {
    selectedTags.value = []
  }
  await getSectionTags(sectionId)
}

// 监听标签选择变化
const handleTagsChange = (tags) => {
  console.log('标签变化:', tags)
  // 将选中的标签数组转换为逗号分隔的字符串
  postForm.value.tags = tags.join(', ')
}

// 上传帖子内容
const uploadContent = async (content) => {
  try {
    // 创建文件对象
    const blob = new Blob([content], { type: 'text/html' })
    const file = new File([blob], 'content.html', { type: 'text/html' })
    
    // 创建 FormData
    const formData = new FormData()
    formData.append('file', file)
    
    console.log('上传帖子内容:', content)
    const response = await PersonalPostApi.uploadContentFile(formData)
    console.log('内容上传响应:', response)
    
    if (response) {
      return {
        contentFileId: response.fileId,
        contentFilePath: response.filePath
      }
    }
    throw new Error('内容上传失败：未获取到文件信息')
  } catch (error) {
    console.error('内容上传失败:', error)
    throw error
  }
}

// 提交帖子
const handleSubmit = async (isPublish = false) => {
  try {
    // 表单验证
    if (!postForm.value.title.trim()) {
      ElMessage.warning('请输入标题')
      return
    }
    if (!postForm.value.content.trim()) {
      ElMessage.warning('请输入内容')
      return
    }
    if (!postForm.value.sectionId) {
      ElMessage.warning('请选择分区')
      return
    }
    if (!postForm.value.summary.trim()) {
      ElMessage.warning('请输入摘要')
      return
    }

    // 先上传内容文件
    const { contentFileId, contentFilePath } = await uploadContent(postForm.value.content)
    
    // 构造提交数据
    const submitData = {
      title: postForm.value.title,
      cover: postForm.value.cover,
      summary: postForm.value.summary,
      contentFileId: contentFileId,
      contentFilePath: contentFilePath,
      sectionId: postForm.value.sectionId,
      tags: postForm.value.tags,
      collectionId: postForm.value.collectionId,
      visibility: postForm.value.visibility,
      hasCitation: postForm.value.citation ? 1 : 0
    }

    // 如果有引用，添加citation对象
    if (postForm.value.citation) {
      submitData.citation = {
        citationTypeId: 1,
        citationContent: postForm.value.citation,
        source: postForm.value.citationSource || ''
      }
    }

    console.log('提交帖子数据:', submitData)
    
    if (isPublish) {
      // 发布帖子
      await PersonalPostApi.publishPost(submitData)
      ElMessage.success('发布成功')
    } else {
      // 判断是新建还是更新
      if (route.query.id) {
        // 更新已有帖子
        await PersonalPostApi.updatePost(submitData)
        ElMessage.success('更新成功')
      } else {
        // 保存新帖子
        await PersonalPostApi.savePost(submitData)
        ElMessage.success('保存成功')
      }
    }
    
    router.push('/personal')
  } catch (error) {
    console.error(isPublish ? '发布帖子失败:' : '保存帖子失败:', error)
    ElMessage.error(isPublish ? '发布失败' : '保存失败')
  }
}

// 取消编辑
const handleCancel = () => {
  router.back()
}

// 处理封面上传
const handleCoverUpload = async (file) => {
  try {
    console.log('上传封面:', file)
    const response = await FileApi.uploadImage(file)
    console.log('封面上传响应:', response)
    
    if (response) {
      postForm.value.cover = response
      return true
    }
    throw new Error('封面上传失败：未获取到图片URL')
  } catch (error) {
    console.error('封面上传失败:', error)
    ElMessage.error('封面上传失败')
    return false
  }
}

const handleImageUpload = async (file, callback) => {
  try {
    console.log('上传图片:', file)
    const response = await FileApi.uploadImage(file)
    console.log('图片上传响应:', response)
    
    // 假设后端返回的是图片的URL
    const imageUrl = response.data
    if (!imageUrl) {
      throw new Error('图片上传失败：未获取到图片URL')
    }
    
    // 将图片URL插入到编辑器
    callback(imageUrl)
  } catch (error) {
    console.error('图片上传失败:', error)
    ElMessage.error('图片上传失败')
  }
}

initPost()
</script>

<template>
  <div class="edit-post-view">
    <div class="edit-card">
      <div class="header">
        <h2>{{ postForm.id ? '编辑帖子' : '发布帖子' }}</h2>
      </div>
      <div class="content">
        <el-form :model="postForm" label-width="80px">
          <el-form-item label="标题" required>
            <el-input v-model="postForm.title" placeholder="请输入标题" />
          </el-form-item>
          <el-form-item label="分区" required>
            <el-select 
              v-model="postForm.sectionId" 
              placeholder="请选择分区"
              :loading="!sections.length"
              @change="handleSectionChange"
            >
              <el-option
                v-for="section in sections"
                :key="section.id"
                :label="section.sectionName"
                :value="section.id"
              >
                <span>{{ section.sectionName }}</span>
                <el-tooltip 
                  v-if="section.sectionDescription"
                  :content="section.sectionDescription"
                  placement="right"
                >
                  <el-icon class="info-icon"><InfoFilled /></el-icon>
                </el-tooltip>
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="标签" v-if="postForm.sectionId">
            <el-select
              v-model="selectedTags"
              multiple
              filterable
              :loading="!sectionTags.length"
              placeholder="请选择标签"
              @change="handleTagsChange"
            >
              <el-option
                v-for="tag in sectionTags"
                :key="tag.id"
                :label="tag.tagName"
                :value="tag.tagName"
              >
                <span>{{ tag.tagName }}</span>
                <el-tooltip 
                  v-if="tag.tagDescription"
                  :content="tag.tagDescription"
                  placement="right"
                >
                  <el-icon class="info-icon"><InfoFilled /></el-icon>
                </el-tooltip>
              </el-option>
            </el-select>
            <div class="form-tip" v-if="sectionTags.length === 0">
              请先选择分区
            </div>
          </el-form-item>
          <el-form-item label="封面">
            <el-upload
              class="cover-uploader"
              :show-file-list="false"
              accept="image/*"
              :before-upload="handleCoverUpload"
            >
              <img v-if="postForm.cover" :src="postForm.cover" class="cover-image" />
              <div v-else class="upload-placeholder">
                <el-icon class="upload-icon"><Upload /></el-icon>
                <span class="upload-text">点击上传封面</span>
              </div>
            </el-upload>
            <div class="form-tip">建议尺寸：400x400，支持 jpg、png、gif 格式</div>
          </el-form-item>
          <el-form-item label="摘要" required>
            <el-input
              v-model="postForm.summary"
              type="textarea"
              :rows="3"
              placeholder="请输入文章摘要"
            />
          </el-form-item>
          <el-form-item label="引用">
            <el-input
              v-model="postForm.citation"
              type="textarea"
              :rows="2"
              placeholder="请输入引用内容"
            />
          </el-form-item>
          <el-form-item label="引用来源" v-if="postForm.citation">
            <el-input
              v-model="postForm.citationSource"
              placeholder="请输入引用来源"
            />
          </el-form-item>
          <el-form-item label="可见性">
            <el-radio-group v-model="postForm.visibility">
              <el-radio :label="0">私密</el-radio>
              <el-radio :label="1">公开</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="合集">
            <el-select
              v-model="postForm.collectionId"
              clearable
              placeholder="请选择合集"
              :loading="!collections.length"
            >
              <el-option
                v-for="collection in collections"
                :key="collection.id"
                :label="collection.collectionName"
                :value="collection.id"
              >
                <div class="collection-option">
                  <span>{{ collection.collectionName }}</span>
                  <el-tooltip 
                    v-if="collection.description"
                    :content="collection.description"
                    placement="right"
                  >
                    <el-icon class="info-icon"><InfoFilled /></el-icon>
                  </el-tooltip>
                </div>
                <div class="collection-info" v-if="collection.postCount">
                  <span class="post-count">{{ collection.postCount }}篇文章</span>
                </div>
              </el-option>
            </el-select>
            <div class="form-tip">
              选择合集可以将文章归类整理，方便阅读和管理
            </div>
          </el-form-item>
          <el-form-item label="内容" required>
            <div class="editor-container">
              <Toolbar
                style="border-bottom: 1px solid #ccc"
                :editor="editorRef"
                :defaultConfig="toolbarConfig"
                mode="default"
              />
              <Editor
                style="height: 500px"
                v-model="editorContent"
                :defaultConfig="editorConfig"
                mode="default"
                @onCreated="editorRef = $event"
                @onChange="handleEditorChange"
              />
            </div>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="handleSubmit(true)">发布</el-button>
            <el-button type="info" @click="handleSubmit(false)">保存草稿</el-button>
            <el-button @click="handleCancel">取消</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<style scoped>
.edit-post-view {
  width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

.edit-card {
  background: #fff;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.header {
  margin-bottom: 24px;
}

.header h2 {
  font-size: 20px;
  font-weight: 600;
  color: #1a1a1a;
  margin: 0;
}

.editor-container {
  border: 1px solid #ccc;
  z-index: 100;
}

.cover-uploader {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  width: 200px;
  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: border-color 0.3s;
}

.cover-uploader:hover {
  border-color: var(--el-color-primary);
}

.cover-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

@media screen and (max-width: 768px) {
  .edit-post-view {
    width: 100%;
    padding: 12px;
  }

  .edit-card {
    padding: 20px;
  }

  .cover-uploader {
    width: 150px;
    height: 150px;
  }
}

.info-icon {
  margin-left: 8px;
  font-size: 14px;
  color: #909399;
}

.form-tip {
  font-size: 12px;
  color: #909399;
  margin-top: 4px;
}

.collection-option {
  display: flex;
  align-items: center;
  gap: 8px;
}

.collection-info {
  margin-top: 4px;
  font-size: 12px;
  color: #909399;
}

.post-count {
  background: #f5f7fa;
  padding: 2px 6px;
  border-radius: 4px;
}

.el-form-item:last-child {
  margin-top: 24px;
  padding-top: 24px;
  border-top: 1px solid #ebeef5;
}

.el-form-item:last-child .el-form-item__content {
  justify-content: center;
  gap: 16px;
}

.upload-placeholder {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
}

.upload-icon {
  font-size: 28px;
  color: #8c939d;
  margin-bottom: 8px;
}

.upload-text {
  font-size: 14px;
  color: #8c939d;
}
</style>