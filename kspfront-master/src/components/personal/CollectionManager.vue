<script setup>
import { ref, onMounted, onBeforeUnmount, onUnmounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, ChatLineSquare, Star, Share, User } from '@element-plus/icons-vue'
import request from '@/utils/request'

const collections = ref([])
const loading = ref(false)
const pagination = ref({
  current: 1,
  size: 10,
  total: 0
})
const showCreateDialog = ref(false)
const showEditDialog = ref(false)
const collectionForm = ref({
  collectionName: '',
  collectionDescription: '',
  visibility: 1 // 默认公开
})
const editingCollection = ref(null)
const collectionFormRef = ref(null)
const collectionFormRules = {
  collectionName: [
    { required: true, message: '请输入合集名称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  collectionDescription: [
    { max: 200, message: '描述不能超过200个字符', trigger: 'blur' }
  ],
  visibility: [
    { required: true, message: '请选择可见性', trigger: 'change' }
  ]
}
const activeTab = ref('created') // 添加标签页状态

// 获取合集列表
const getCollections = async () => {
  loading.value = true
  try {
    const url = activeTab.value === 'created' 
      ? '/api/client/personal/collection/created'
      : '/api/client/personal/collection/subscribed'
      
    const response = await request.get(url, {
      params: {
        current: pagination.value.current,
        size: pagination.value.size
      }
    })
    if (response) {
      collections.value = response.records || []
      pagination.value.total = response.total || 0
      pagination.value.current = response.current || 1
    } else {
      collections.value = []
      pagination.value.total = 0
    }
  } catch (error) {
    console.error('获取合集列表失败:', error)
    ElMessage.error('获取合集列表失败')
    collections.value = []
  } finally {
    loading.value = false
  }
}

// 处理标签页切换
const handleTabChange = (tab) => {
  activeTab.value = tab
  pagination.value.current = 1
  getCollections()
}

const handleSizeChange = (size) => {
  pagination.value.size = size
  pagination.value.current = 1
  getCollections()
}

// 创建合集
const createCollection = async () => {
  if (!collectionFormRef.value) return
  
  try {
    await collectionFormRef.value.validate()
    const response = await request.put('/api/client/personal/collection/add', {
      collectionName: collectionForm.value.collectionName,
      collectionDescription: collectionForm.value.collectionDescription,
      visibility: collectionForm.value.visibility
    })
    
    if (response) {
      ElMessage.success('创建成功')
      showCreateDialog.value = false
      collectionForm.value = { 
        collectionName: '', 
        collectionDescription: '', 
        visibility: 1 
      }
      await getCollections()
    } else {
      throw new Error(response?.msg || '创建失败')
    }
  } catch (error) {
    console.error('创建合集失败:', error)
    ElMessage.error(error.message || '创建合集失败')
  }
}

// 编辑合集
const editCollection = async () => {
  try {
    const response = await request.put('/api/client/personal/collection', {
      id: editingCollection.value.id,
      collectionName: collectionForm.value.collectionName,
      collectionDescription: collectionForm.value.collectionDescription,
      visibility: collectionForm.value.visibility
    })
    
    if (response) {
      ElMessage.success('修改成功')
      showEditDialog.value = false
      await getCollections()
    } else {
      throw new Error(response?.msg || '修改失败')
    }
  } catch (error) {
    console.error('修改合集失败:', error)
    ElMessage.error(error.message || '修改合集失败')
  }
}

// 删除合集
const deleteCollection = async (collection) => {
  try {
    await ElMessageBox.confirm('确定要删除该合集吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    
    await request.delete('/api/admin/management/collection/' + collection.id)
    ElMessage.success('删除成功')
    getCollections()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除合集失败:', error)
      ElMessage.error('删除合集失败')
    }
  }
}

// 打开编辑对话框
const openEditDialog = (collection) => {
  editingCollection.value = collection
  collectionForm.value = {
    collectionName: collection.collectionName,
    collectionDescription: collection.collectionDescription || '',
    visibility: collection.visibility
  }
  showEditDialog.value = true
}

onMounted(() => {
  getCollections()
})

// 组件卸载前的清理
onBeforeUnmount(async () => {
  await nextTick()
  collections.value = []
  loading.value = false
  showCreateDialog.value = false
  showEditDialog.value = false
  collectionForm.value = {
    collectionName: '',
    collectionDescription: '',
    cover: ''
  }
  editingCollection.value = null
  collectionFormRef.value = null
})

// 组件卸载时的清理
onUnmounted(() => {
  window.$currentInstance = null
  loading.value = false
  showCreateDialog.value = false
  showEditDialog.value = false
})
</script>

<template>
  <div class="collection-manager">
    <div class="collection-header">
      <el-tabs v-model="activeTab" @tab-change="handleTabChange" class="collection-tabs">
        <el-tab-pane label="我创建的" name="created" />
        <el-tab-pane label="我订阅的" name="subscribed" />
      </el-tabs>
      <el-button type="primary" size="small" @click="showCreateDialog = true">
        新建合集
      </el-button>
    </div>

    <div v-loading="loading">
      <!-- 骨架屏 -->
      <template v-if="loading">
        <div class="collections-grid">
          <div v-for="i in 3" :key="i" class="collection-item skeleton">
            <el-skeleton animated>
              <template #template>
                <div class="skeleton-content">
                  <el-skeleton-item variant="image" style="width: 100%; height: 160px" />
                  <div class="skeleton-info">
                    <el-skeleton-item variant="h3" style="width: 50%" />
                    <el-skeleton-item variant="text" style="width: 60%" />
                  </div>
                </div>
              </template>
            </el-skeleton>
          </div>
        </div>
      </template>

      <!-- 合集列表 -->
      <template v-else>
        <div v-if="collections.length" class="collections-grid">
          <div v-for="collection in collections" :key="collection.id" class="collection-item">
            <div class="collection-info">
              <h4>{{ collection.collectionName }}</h4>
              <p class="description">{{ collection.collectionDescription || '暂无描述' }}</p>
              <div class="collection-meta">
                <span class="time">{{ collection.creationTime }}</span>
                <span class="visibility">{{ collection.visibility === 1 ? '公开' : '私密' }}</span>
                <span v-if="collection.reviewStatus === 0" class="review-status">审核中</span>
              </div>
              <div class="collection-stats">
                <span><el-icon><ChatLineSquare /></el-icon> {{ collection.commentCount || 0 }}条评论</span>
                <span><el-icon><Star /></el-icon> {{ collection.likeCount || 0 }}人点赞</span>
                <span><el-icon><Share /></el-icon> {{ collection.shareCount || 0 }}次分享</span>
                <span><el-icon><User /></el-icon> {{ collection.subscribeCount || 0 }}人订阅</span>
              </div>
              <div class="collection-actions" v-if="activeTab === 'created'">
                <el-button type="primary" link @click="openEditDialog(collection)">编辑</el-button>
                <el-button type="danger" link @click="deleteCollection(collection)">删除</el-button>
              </div>
            </div>
          </div>
        </div>

        <!-- 空状态 -->
        <el-empty v-else :description="activeTab === 'created' ? '暂无创建的合集' : '暂无订阅的合集'">
          <el-button v-if="activeTab === 'created'" type="primary" @click="showCreateDialog = true">
            新建合集
          </el-button>
        </el-empty>

        <!-- 分页 -->
        <el-pagination
          v-if="pagination.total > 0"
          v-model:current-page="pagination.current"
          v-model:page-size="pagination.size"
          :page-sizes="[10, 20, 50]"
          :total="pagination.total"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handlePageChange"
          background
          class="pagination"
        />
      </template>
    </div>

    <!-- 创建合集对话框 -->
    <el-dialog
      v-model="showCreateDialog"
      title="新建合集"
      width="500px"
      @close="collectionFormRef?.resetFields()"
      destroy-on-close
    >
      <el-form
        ref="collectionFormRef"
        :model="collectionForm"
        :rules="collectionFormRules"
        label-width="80px"
        status-icon
      >
        <el-form-item label="名称" prop="collectionName">
          <el-input 
            v-model="collectionForm.collectionName" 
            placeholder="请输入合集名称"
            maxlength="20"
            show-word-limit
          />
        </el-form-item>
        <el-form-item label="描述" prop="collectionDescription">
          <el-input
            v-model="collectionForm.collectionDescription"
            type="textarea"
            placeholder="请输入合集描述"
            maxlength="200"
            show-word-limit
            :rows="4"
          />
        </el-form-item>
        <el-form-item label="可见性" prop="visibility">
          <el-radio-group v-model="collectionForm.visibility">
            <el-radio :label="1">公开</el-radio>
            <el-radio :label="0">私密</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreateDialog = false">取消</el-button>
        <el-button type="primary" @click="createCollection">确定</el-button>
      </template>
    </el-dialog>

    <!-- 编辑合集对话框 -->
    <el-dialog
      v-model="showEditDialog"
      title="编辑合集"
      width="500px"
    >
      <el-form
        :model="collectionForm"
        :rules="collectionFormRules"
        label-width="80px"
      >
        <el-form-item label="名称" prop="collectionName">
          <el-input 
            v-model="collectionForm.collectionName" 
            placeholder="请输入合集名称"
            maxlength="20"
            show-word-limit
          />
        </el-form-item>
        <el-form-item label="描述" prop="collectionDescription">
          <el-input
            v-model="collectionForm.collectionDescription"
            type="textarea"
            placeholder="请输入合集描述"
            maxlength="200"
            show-word-limit
            :rows="4"
          />
        </el-form-item>
        <el-form-item label="可见性" prop="visibility">
          <el-radio-group v-model="collectionForm.visibility">
            <el-radio :label="1">公开</el-radio>
            <el-radio :label="0">私密</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showEditDialog = false">取消</el-button>
        <el-button type="primary" @click="editCollection">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.collection-manager {
  background: #fff;
  border-radius: 8px;
  padding: 12px;
}

.collection-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.collection-tabs {
  margin-right: 12px;
}

.collection-tabs :deep(.el-tabs__header) {
  /* padding: -30px 0px; */
  margin-bottom: -10px;
  margin-top: -40px;
  margin-left: -20px;
}



.collection-tabs :deep(.el-tabs__nav-wrap::after) {
  width: 160px;
  height: 2px;
  left: 18px;
}

.collection-tabs :deep(.el-tabs__content) {
  overflow: visible;
}

.collection-tabs :deep(.el-tab-pane) {
  min-height: unset !important;
}

.collections-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
  gap: 12px;
  margin-bottom: 12px;
}

.collection-item {
  border: 1px solid #e4e7ed;
  border-radius: 4px;
  transition: all 0.3s ease;
  background: #fff;
  padding: 12px;
}

.collection-info {
  padding: 0;
}

.collection-info h4 {
  margin: 0 0 8px;
  font-size: 14px;
  font-weight: 500;
  color: #303133;
  line-height: 1.4;
}

.description {
  font-size: 12px;
  color: #606266;
  margin: 0 0 8px;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.collection-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  font-size: 12px;
  color: #909399;
  margin-bottom: 8px;
}

.collection-meta .time {
  color: #909399;
}

.collection-meta .visibility,
.collection-meta .review-status {
  background: #f0f2f5;
  padding: 1px 6px;
  border-radius: 2px;
  font-size: 12px;
}

.collection-meta .review-status {
  background: #fdf6ec;
  color: #e6a23c;
}

.collection-stats {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  font-size: 12px;
  color: #909399;
  margin-top: 8px;
}

.collection-stats span {
  display: flex;
  align-items: center;
  gap: 4px;
}

.collection-actions {
  margin-top: 6px;
  padding-top: 6px;
  border-top: 1px solid #f0f2f5;
  display: flex;
  gap: 8px;
  justify-content: flex-end;
}

.collection-actions .el-button {
  padding: 4px 8px;
}

.pagination {
  margin-top: 12px;
  display: flex;
  justify-content: center;
}
</style> 