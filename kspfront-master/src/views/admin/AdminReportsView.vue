<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

const reports = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)
const detailDialogVisible = ref(false)
const currentReport = ref(null)
const handleDialogVisible = ref(false)
const handleForm = ref({
  reportId: null,
  status: 2,
  outcome: 0
})

// 筛选条件
const filterForm = ref({
  userId: '',
  reportedTypeId: '',
  reportTypeId: '',
  status: '',
  startTime: '',
  endTime: ''
})

// 举报对象类型选项
const reportedTypeOptions = [
  { label: '帖子', value: 1 },
  { label: '评论', value: 2 },
  { label: '用户', value: 3 }
]

// 举报类型选项
const reportTypeOptions = [
  { label: '垃圾广告', value: 1 },
  { label: '违法违规', value: 2 },
  { label: '色情低俗', value: 3 },
  { label: '人身攻击', value: 4 },
  { label: '其他', value: 5 }
]

// 处理状态选项
const statusOptions = [
  { label: '待处理', value: 0 },
  { label: '正在处理', value: 1 },
  { label: '已处理', value: 2 },
  { label: '无需处理', value: 3 }
]

// 处理结果选项
const outcomeOptions = [
  { label: '无行动', value: 0 },
  { label: '内容已删除', value: 1 },
  { label: '警告用户', value: 2 },
  { label: '用户禁言', value: 3 },
  { label: '用户封禁', value: 4 }
]

// 格式化时间
const formatDateTime = (time) => {
  if (!time) return ''
  return time.replace('T', ' ')
}

// 获取举报列表
const getReports = async () => {
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

    const response = await request.get('/api/admin/management/report/list', { params })
    if (response) {
      reports.value = response.records
      total.value = response.total
    } else {
      reports.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取举报列表失败:', error)
    ElMessage.error('获取举报列表失败')
  } finally {
    loading.value = false
  }
}

// 查看举报详情
const viewReportDetail = async (reportId) => {
  try {
    const response = await request.get('/api/admin/management/report/' + reportId)
    if (response) {
      currentReport.value = response
      detailDialogVisible.value = true
    }
  } catch (error) {
    console.error('获取举报详情失败:', error)
    ElMessage.error('获取举报详情失败')
  }
}

// 打开处理对话框
const openHandleDialog = (report) => {
  handleForm.value = {
    reportId: report.id,
    status: 2,
    outcome: 0
  }
  handleDialogVisible.value = true
}

// 处理举报
const handleReport = async () => {
  try {
    await request.post('/api/admin/management/report/handle', handleForm.value)
    ElMessage.success('处理成功')
    handleDialogVisible.value = false
    getReports()
  } catch (error) {
    console.error('处理失败:', error)
    ElMessage.error('处理失败')
  }
}

// 处理筛选
const handleFilter = () => {
  currentPage.value = 1
  getReports()
}

// 重置筛选
const resetFilter = () => {
  filterForm.value = {
    userId: '',
    reportedTypeId: '',
    reportTypeId: '',
    status: '',
    startTime: '',
    endTime: ''
  }
  currentPage.value = 1
  getReports()
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  getReports()
}

// 处理每页条数变化
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getReports()
}

onMounted(() => {
  getReports()
})
</script>

<template>
  <div class="reports-manage">
    <!-- 筛选栏 -->
    <el-card class="filter-card">
      <el-form :model="filterForm" inline>
        <!-- <el-form-item label="举报用户ID">
          <el-input
            v-model="filterForm.userId"
            placeholder="请输入用户ID"
            clearable
            @keyup.enter="handleFilter"
          />
        </el-form-item> -->
        <el-form-item label="举报对象">
          <el-select v-model="filterForm.reportedTypeId" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in reportedTypeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="举报类型">
          <el-select v-model="filterForm.reportTypeId" placeholder="全部" clearable style="width: 120px;">
            <el-option
              v-for="item in reportTypeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="处理状态">
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
    
    <!-- 举报列表 -->
    <el-card shadow="never" class="table-card">
      <el-table
        :data="reports"
        style="width: 100%"
        v-loading="loading"
      >
        <el-table-column prop="id" label="ID" width="80" />
        
        <el-table-column label="举报用户" width="120">
          <template #default="{ row }">
            {{ row.username }}
          </template>
        </el-table-column>
        
        <el-table-column label="举报对象" width="100">
          <template #default="{ row }">
            <el-tag>{{ row.reportedTypeName }}</el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="举报类型" width="100">
          <template #default="{ row }">
            <el-tag type="warning">{{ row.reportTypeName }}</el-tag>
          </template>
        </el-table-column>
        
        <el-table-column prop="reason" label="举报理由" min-width="200" show-overflow-tooltip />
        
        <el-table-column label="举报时间" width="180">
          <template #default="{ row }">
            {{ formatDateTime(row.reportTime) }}
          </template>
        </el-table-column>

        <el-table-column label="处理状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status === 0 ? 'info' : row.status === 1 ? 'warning' : row.status === 2 ? 'success' : 'danger'">
              {{ statusOptions.find(item => item.value === row.status)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button
              type="primary"
              size="small"
              @click="viewReportDetail(row.id)"
            >
              详情
            </el-button>
            
            <el-button
              v-if="row.status !== 2 && row.status !== 3"
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
      title="举报详情"
      width="600px"
    >
      <template v-if="currentReport">
        <div class="detail-item">
          <span class="label">举报ID：</span>
          <span>{{ currentReport.id }}</span>
        </div>
        <div class="detail-item">
          <span class="label">举报用户：</span>
          <span>{{ currentReport.username }}</span>
        </div>
        <div class="detail-item">
          <span class="label">举报对象：</span>
          <span>{{ currentReport.reportedTypeName }}</span>
        </div>
        <div class="detail-item">
          <span class="label">举报类型：</span>
          <span>{{ currentReport.reportTypeName }}</span>
        </div>
        <div class="detail-item">
          <span class="label">举报理由：</span>
          <span>{{ currentReport.reason }}</span>
        </div>
        <div class="detail-item">
          <span class="label">被举报内容：</span>
          <span>{{ currentReport.reportedContent }}</span>
        </div>
        <div class="detail-item">
          <span class="label">举报时间：</span>
          <span>{{ formatDateTime(currentReport.reportTime) }}</span>
        </div>
        <div class="detail-item">
          <span class="label">处理状态：</span>
          <el-tag :type="currentReport.status === 0 ? 'info' : currentReport.status === 1 ? 'warning' : currentReport.status === 2 ? 'success' : 'danger'">
            {{ statusOptions.find(item => item.value === currentReport.status)?.label }}
          </el-tag>
        </div>
        <div v-if="currentReport.status === 2" class="detail-item">
          <span class="label">处理结果：</span>
          <el-tag type="success">
            {{ outcomeOptions.find(item => item.value === currentReport.outcome)?.label }}
          </el-tag>
        </div>
      </template>
    </el-dialog>

    <!-- 处理对话框 -->
    <el-dialog
      v-model="handleDialogVisible"
      title="处理举报"
      width="500px"
    >
      <el-form :model="handleForm" label-width="80px">
        <el-form-item label="处理状态">
          <el-radio-group v-model="handleForm.status">
            <el-radio :label="2">已处理</el-radio>
            <el-radio :label="3">无需处理</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="处理结果" v-if="handleForm.status === 2">
          <el-select v-model="handleForm.outcome" placeholder="请选择处理结果" style="width: 100%;">
            <el-option
              v-for="item in outcomeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="handleDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleReport">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.reports-manage {
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

.mx-2 {
  margin: 0 8px;
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
  .reports-manage {
    padding: 12px;
  }
  
  .filter-card :deep(.el-form-item) {
    margin-bottom: 12px;
  }
}
</style> 