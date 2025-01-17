<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

const collections = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)
const showDialog = ref(false)
const dialogTitle = ref('')
const isEdit = ref(false)

// 筛选条件
const filterForm = ref({
  collectionName: '',
  creatorId: '',
  visibility: '',
  reviewStatus: '',
  startTime: '',
  endTime: ''
})

// 可见性选项
const visibilityOptions = [
  { label: '私密', value: 0 },
  { label: '公开', value: 1 }
]

// 审核状态选项
const reviewStatusOptions = [
  { label: '待审核', value: 0 },
  { label: '已审核', value: 1 }
]

const formData = reactive({
  id: null,
  collectionName: '',
  collectionDescription: '',
  creatorId: null,
  visibility: 1
})

const rules = {
  collectionName: [
    { required: true, message: '请输入合集名称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在2-20个字符之间', trigger: 'blur' }
  ],
  collectionDescription: [
    { max: 200, message: '长度不能超过200个字符', trigger: 'blur' }
  ],
  creatorId: [
    { required: true, message: '请输入创建者ID', trigger: 'blur' },
    { type: 'number', message: '创建者ID必须为数字', trigger: 'blur' }
  ],
  visibility: [
    { required: true, message: '请选择可见性', trigger: 'change' }
  ]
}

const formRef = ref(null)

// 获取合集列表
const getCollections = async () => {
  loading.value = true
  try {
    const params = {
      current: currentPage.value,
      size: pageSize.value,
      ...filterForm.value
    }
    
    // 移除空值
    Object.keys(params).forEach(key => {
      if (params[key] === '') {
        delete params[key]
      }
    })

    const response = await request.get('/admin/collection/page', { params })
    if (response) {
      collections.value = response.records
      total.value = response.total
    } else {
      collections.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取合集列表失败:', error)
    ElMessage.error('获取合集列表失败')
  } finally {
    loading.value = false
  }
}

// 打开创建对话框
const openCreateDialog = () => {
  isEdit.value = false
  dialogTitle.value = '创建合集'
  Object.assign(formData, {
    id: null,
    collectionName: '',
    collectionDescription: '',
    creatorId: null,
    visibility: 1
  })
  showDialog.value = true
}

// 打开编辑对话框
const openEditDialog = (row) => {
  isEdit.value = true
  dialogTitle.value = '编辑合集'
  Object.assign(formData, {
    id: row.id,
    collectionName: row.collectionName,
    collectionDescription: row.collectionDescription,
    creatorId: row.creatorId,
    visibility: row.visibility
  })
  showDialog.value = true
}

// 提交表单
const submitForm = async () => {
  if (!formRef.value) return
  
  try {
    await formRef.value.validate()
    
    if (isEdit.value) {
      await request.put('/admin/collection', formData)
      ElMessage.success('更新成功')
    } else {
      await request.post('/admin/collection', formData)
      ElMessage.success('创建成功')
    }
    
    showDialog.value = false
    getCollections()
  } catch (error) {
    if (error.response?.data?.message) {
      ElMessage.error(error.response.data.message)
    } else {
      ElMessage.error(isEdit.value ? '更新成功' : '创建失败')
    }
  }
}

// 删除合集
const deleteCollection = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除该合集吗？此操作不可恢复', '警告', {
      type: 'warning'
    })
    
    await request.delete(`/api/admin/management/collection/${id}`)
    ElMessage.success('删除成功')
    getCollections()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除失败:', error)
      ElMessage.error('删除失败')
    }
  }
}

// 处理筛选
const handleFilter = () => {
  currentPage.value = 1
  getCollections()
}

// 重置筛选
const resetFilter = () => {
  filterForm.value = {
    collectionName: '',
    creatorId: '',
    visibility: '',
    reviewStatus: '',
    startTime: '',
    endTime: ''
  }
  currentPage.value = 1
  getCollections()
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  getCollections()
}

// 处理每页条数变化
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getCollections()
}

onMounted(() => {
  getCollections()
})
</script>

<template>
  <div class="collections-manage">
    <!-- 筛选栏 -->
    <el-card class="filter-card">
      <el-form :model="filterForm" inline>
        <el-form-item label="合集名称">
          <el-input
            v-model="filterForm.collectionName"
            placeholder="请输入合集名称"
            clearable
            @keyup.enter="handleFilter"
          />
        </el-form-item>
        <el-form-item label="创建者ID">
          <el-input
            v-model="filterForm.creatorId"
            placeholder="请输入创建者ID"
            clearable
            @keyup.enter="handleFilter"
          />
        </el-form-item>
        <el-form-item label="可见性">
          <el-select v-model="filterForm.visibility" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in visibilityOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-select v-model="filterForm.reviewStatus" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in reviewStatusOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
   
        <el-form-item>
          <el-button type="primary" @click="handleFilter">筛选</el-button>
          <el-button @click="resetFilter">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
    
    <!-- 工具栏 -->
    <div class="toolbar">
      <el-button type="primary" @click="openCreateDialog">
        <el-icon><Plus /></el-icon>
        创建合集
      </el-button>
    </div>
    
    <!-- 合集列表 -->
    <el-card shadow="never" class="table-card">
      <el-table
        :data="collections"
        style="width: 100%"
        v-loading="loading"
      >
        <el-table-column prop="id" label="ID" width="80" />
        
        <el-table-column prop="collectionName" label="合集名称" min-width="150" />
        
        <el-table-column prop="collectionDescription" label="描述" min-width="200" show-overflow-tooltip />
        
        <el-table-column prop="creatorId" label="创建者ID" width="100" />

        <el-table-column label="时间信息" width="200">
          <template #default="{ row }">
            <div class="time-info">
              <div>创建：{{ row.creationTime }}</div>
              <div>更新：{{ row.updateTime }}</div>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="统计信息" width="280">
          <template #default="{ row }">
            <div class="stat-info">
              <el-tooltip content="点赞数">
                <span class="stat-item">
                  <el-icon><Star /></el-icon>
                  {{ row.likeCount }}
                </span>
              </el-tooltip>
              <el-tooltip content="评论数">
                <span class="stat-item">
                  <el-icon><ChatDotRound /></el-icon>
                  {{ row.commentCount }}
                </span>
              </el-tooltip>
              <el-tooltip content="订阅数">
                <span class="stat-item">
                  <el-icon><Bell /></el-icon>
                  {{ row.subscribeCount }}
                </span>
              </el-tooltip>
              <el-tooltip content="分享数">
                <span class="stat-item">
                  <el-icon><Share /></el-icon>
                  {{ row.shareCount }}
                </span>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>
        
        <el-table-column label="状态" width="200">
          <template #default="{ row }">
            <div class="status-tags">
              <el-tag :type="row.visibility === 1 ? 'success' : 'info'">
                {{ row.visibility === 1 ? '公开' : '私密' }}
              </el-tag>
              <el-tag :type="row.reviewStatus === 1 ? 'success' : 'warning'">
                {{ row.reviewStatus === 1 ? '已审核' : '待审核' }}
              </el-tag>
              <el-tag :type="row.isDeleted === 1 ? 'danger' : 'success'">
                {{ row.isDeleted === 1 ? '已删除' : '正常' }}
              </el-tag>
            </div>
          </template>
        </el-table-column>
        
        <el-table-column label="操作" width="150" fixed="right">
          <template #default="{ row }">
            <el-button
              type="primary"
              size="small"
              @click="openEditDialog(row)"
            >
              编辑
            </el-button>
            
            <el-button
              type="danger"
              size="small"
              @click="deleteCollection(row.id)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="pagination">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          :total="total"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </el-card>
    
    <!-- 创建/编辑对话框 -->
    <el-dialog
      v-model="showDialog"
      :title="dialogTitle"
      width="500px"
    >
      <el-form
        ref="formRef"
        :model="formData"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item label="名称" prop="collectionName">
          <el-input v-model="formData.collectionName" placeholder="请输入合集名称" />
        </el-form-item>
        
        <el-form-item label="描述" prop="collectionDescription">
          <el-input
            v-model="formData.collectionDescription"
            type="textarea"
            :rows="4"
            placeholder="请输入合集描述"
          />
        </el-form-item>
        
        <el-form-item label="创建者" prop="creatorId">
          <el-input-number
            v-model="formData.creatorId"
            :min="1"
            placeholder="请输入创建者ID"
          />
        </el-form-item>

        <el-form-item label="可见性" prop="visibility">
          <el-select v-model="formData.visibility" placeholder="请选择可见性">
            <el-option
              v-for="item in visibilityOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
      
      <template #footer>
        <el-button @click="showDialog = false">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.collections-manage {
  padding: 24px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.filter-card {
  margin-bottom: 16px;
}

.toolbar {
  margin-bottom: 16px;
}

.table-card {
  margin-bottom: 16px;
}

.pagination {
  margin-top: 16px;
  display: flex;
  justify-content: flex-end;
}

.mx-2 {
  margin: 0 8px;
}

.time-info {
  display: flex;
  flex-direction: column;
  gap: 4px;
  font-size: 13px;
  color: #606266;
}

.stat-info {
  display: flex;
  align-items: center;
  gap: 16px;
}

.stat-item {
  display: flex;
  align-items: center;
  gap: 4px;
  color: #606266;
}

.status-tags {
  display: flex;
  gap: 4px;
}

@media screen and (max-width: 768px) {
  .collections-manage {
    padding: 12px;
  }
  
  .filter-card :deep(.el-form-item) {
    margin-bottom: 12px;
  }
}
</style> 