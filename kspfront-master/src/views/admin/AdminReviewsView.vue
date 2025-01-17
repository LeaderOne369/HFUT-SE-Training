<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

const reviews = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)
const detailDialogVisible = ref(false)
const currentReview = ref(null)
const handleDialogVisible = ref(false)
const handleForm = ref({
  status: 1,
  reason: ''
})

// 筛选条件
const filterForm = ref({
  type: '',
  status: ''
})

// 审核类型选项
const typeOptions = [
  { label: '用户', value: 0 },
  { label: '帖子', value: 1 },
  { label: '合集', value: 2 },
  { label: '收藏夹', value: 3 }
]

// 审核状态选项
const statusOptions = [
  { label: '待审核', value: 0 },
  { label: '已通过', value: 1 },
  { label: '已拒绝', value: 2 }
]

// 格式化时间
const formatDateTime = (time) => {
  if (!time) return ''
  return time.replace('T', ' ')
}

// 获取审核列表
const getReviews = async () => {
  loading.value = true
  try {
    const params = {
      page: currentPage.value,
      size: pageSize.value,
      ...filterForm.value
    }
    
    // 移除空值
    Object.keys(params).forEach(key => {
      if (params[key] === '') {
        delete params[key]
      }
    })

    const response = await request.get('/api/admin/management/review/list', { params })
    if (response) {
      reviews.value = response.records
      total.value = response.total
    } else {
      reviews.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取审核列表失败:', error)
    ElMessage.error('获取审核列表失败')
  } finally {
    loading.value = false
  }
}

// 查看审核详情
const viewReviewDetail = async (reviewId) => {
  try {
    const response = await request.get('/api/admin/management/review/' + reviewId)
    if (response?.data) {
      currentReview.value = response.data
      detailDialogVisible.value = true
    }
  } catch (error) {
    console.error('获取审核详情失败:', error)
    ElMessage.error('获取审核详情失败')
  }
}

// 打开处理对话框
const openHandleDialog = (review) => {
  handleForm.value = {
    status: 1,
    reason: ''
  }
  handleDialogVisible.value = true
}

// 处理审核
const handleReview = async () => {
  try {
    await request.post('/api/admin/management/review/handle', handleForm.value)
    ElMessage.success('处理成功')
    handleDialogVisible.value = false
    getReviews()
  } catch (error) {
    console.error('处理失败:', error)
    ElMessage.error('处理失败')
  }
}

// 处理筛选
const handleFilter = () => {
  currentPage.value = 1
  getReviews()
}

// 重置筛选
const resetFilter = () => {
  filterForm.value = {
    type: '',
    status: ''
  }
  currentPage.value = 1
  getReviews()
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  getReviews()
}

// 处理每页条数变化
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getReviews()
}

onMounted(() => {
  getReviews()
})
</script>

<template>
  <div class="reviews-manage">
    <!-- 筛选栏 -->
    <el-card class="filter-card">
      <el-form :model="filterForm" inline>
        <el-form-item label="审核类型">
          <el-select v-model="filterForm.type" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in typeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-select v-model="filterForm.status" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in statusOptions"
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
    
    <!-- 审核列表 -->
    <el-card shadow="never" class="table-card">
      <el-table
        :data="reviews"
        style="width: 100%"
        v-loading="loading"
      >
        <el-table-column prop="id" label="ID" width="80" />
        
        <el-table-column label="审核类型" width="100">
          <template #default="{ row }">
            <el-tag>{{ typeOptions.find(item => item.value === row.contentType)?.label }}</el-tag>
          </template>
        </el-table-column>
        
        <el-table-column prop="contentId" label="内容ID" width="100" />
        
        <el-table-column prop="reviewerName" label="审核人" width="120" />
        
        <el-table-column prop="reviewNotes" label="审核备注" min-width="200" show-overflow-tooltip />
        
        <el-table-column label="审核时间" width="180">
          <template #default="{ row }">
            {{ formatDateTime(row.reviewTime) }}
          </template>
        </el-table-column>

        <el-table-column label="审核状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.reviewStatus === 0 ? 'info' : row.reviewStatus === 1 ? 'success' : 'danger'">
              {{ statusOptions.find(item => item.value === row.reviewStatus)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button
              type="primary"
              size="small"
              @click="viewReviewDetail(row.id)"
            >
              详情
            </el-button>
            
            <el-button
              v-if="row.reviewStatus === 0"
              type="success"
              size="small"
              class="ml-2"
              @click="openHandleDialog(row)"
            >
              处理
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

    <!-- 详情对话框 -->
    <el-dialog
      v-model="detailDialogVisible"
      title="审核详情"
      width="600px"
    >
      <template v-if="currentReview">
        <div class="detail-item">
          <span class="label">审核ID：</span>
          <span>{{ currentReview.id }}</span>
        </div>
        <div class="detail-item">
          <span class="label">内容ID：</span>
          <span>{{ currentReview.contentId }}</span>
        </div>
        <div class="detail-item">
          <span class="label">审核类型：</span>
          <span>{{ typeOptions.find(item => item.value === currentReview.contentType)?.label }}</span>
        </div>
        <div class="detail-item">
          <span class="label">审核人：</span>
          <span>{{ currentReview.reviewerName }}</span>
        </div>
        <div class="detail-item">
          <span class="label">审核时间：</span>
          <span>{{ formatDateTime(currentReview.reviewTime) }}</span>
        </div>
        <div class="detail-item">
          <span class="label">审核状态：</span>
          <el-tag :type="currentReview.reviewStatus === 0 ? 'info' : currentReview.reviewStatus === 1 ? 'success' : 'danger'">
            {{ statusOptions.find(item => item.value === currentReview.reviewStatus)?.label }}
          </el-tag>
        </div>
        <div class="detail-item">
          <span class="label">审核备注：</span>
          <span>{{ currentReview.reviewNotes }}</span>
        </div>
      </template>
    </el-dialog>

    <!-- 处理对话框 -->
    <el-dialog
      v-model="handleDialogVisible"
      title="处理审核"
      width="500px"
    >
      <el-form :model="handleForm" label-width="80px">
        <el-form-item label="处理结果">
          <el-radio-group v-model="handleForm.status">
            <el-radio :label="1">通过</el-radio>
            <el-radio :label="2">拒绝</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="处理原因">
          <el-input
            v-model="handleForm.reason"
            type="textarea"
            rows="3"
            placeholder="请输入处理原因"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="handleDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleReview">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.reviews-manage {
  padding: 24px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.filter-card {
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

.ml-2 {
  margin-left: 8px;
}

.detail-item {
  margin-bottom: 16px;
  line-height: 1.5;
}

.detail-item .label {
  font-weight: bold;
  margin-right: 8px;
  color: #606266;
}

@media screen and (max-width: 768px) {
  .reviews-manage {
    padding: 12px;
  }
  
  .filter-card :deep(.el-form-item) {
    margin-bottom: 12px;
  }
}
</style> 