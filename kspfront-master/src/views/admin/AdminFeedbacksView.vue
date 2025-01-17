<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

const feedbacks = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

// 筛选条件
const filterForm = ref({
  userId: '',
  feedbackContent: '',
  status: '',
  startTime: '',
  endTime: ''
})

// 反馈状态选项
const statusOptions = [
  { label: '待处理', value: 0 },
  { label: '处理中', value: 1 },
  { label: '已完成', value: 2 },
  { label: '已关闭', value: 3 }
]

// 格式化时间
const formatDateTime = (time) => {
  if (!time) return ''
  return time.replace('T', ' ')
}

// 获取反馈列表
const getFeedbacks = async () => {
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

    const response = await request.get('/api/admin/management/feedback/query', { params })
    if (response) {
      feedbacks.value = response.records
      total.value = response.total
    } else {
      feedbacks.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取反馈列表失败:', error)
    ElMessage.error('获取反馈列表失败')
  } finally {
    loading.value = false
  }
}

// 更新反馈状态
const updateStatus = async (id, status) => {
  try {
    await request.put('/api/admin/management/feedback/updateStatus', null, {
      params: { id, status }
    })
    ElMessage.success('更新状态成功')
    getFeedbacks()
  } catch (error) {
    console.error('更新状态失败:', error)
    ElMessage.error('更新状态失败')
  }
}

// 删除反馈
const deleteFeedback = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除该反馈吗？此操作不可恢复', '警告', {
      type: 'warning'
    })
    
    await request.delete('/api/admin/management/feedback/delete', {
      params: { id }
    })
    ElMessage.success('删除成功')
    getFeedbacks()
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
  getFeedbacks()
}

// 重置筛选
const resetFilter = () => {
  filterForm.value = {
    userId: '',
    feedbackContent: '',
    status: '',
    startTime: '',
    endTime: ''
  }
  currentPage.value = 1
  getFeedbacks()
}

// 处理页码变化
const handleCurrentChange = (page) => {
  currentPage.value = page
  getFeedbacks()
}

// 处理每页条数变化
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getFeedbacks()
}

onMounted(() => {
  getFeedbacks()
})
</script>

<template>
  <div class="feedbacks-manage">
    <!-- 筛选栏 -->
    <el-card class="filter-card">
      <el-form :model="filterForm" inline>
        <el-form-item label="用户ID">
          <el-input
            v-model="filterForm.userId"
            placeholder="请输入用户ID"
            clearable
            @keyup.enter="handleFilter"
          />
        </el-form-item>
        <el-form-item label="反馈内容">
          <el-input
            v-model="filterForm.feedbackContent"
            placeholder="请输入反馈内容"
            clearable
            @keyup.enter="handleFilter"
          />
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
    
    <!-- 反馈列表 -->
    <el-card shadow="never" class="table-card">
      <el-table
        :data="feedbacks"
        style="width: 100%"
        v-loading="loading"
      >
        <el-table-column prop="id" label="ID" width="80" />
        
        <el-table-column prop="userId" label="用户ID" width="100" />
        
        <el-table-column prop="feedbackContent" label="反馈内容" min-width="300" show-overflow-tooltip />
        
        <el-table-column label="反馈时间" width="180">
          <template #default="{ row }">
            {{ formatDateTime(row.feedbackTime) }}
          </template>
        </el-table-column>

        <el-table-column label="处理状态" width="120">
          <template #default="{ row }">
            <el-tag :type="row.status === 0 ? 'info' : row.status === 1 ? 'warning' : row.status === 2 ? 'success' : 'danger'">
              {{ statusOptions.find(item => item.value === row.status)?.label }}
            </el-tag>
          </template>
        </el-table-column>
        
        <el-table-column label="操作" width="250" fixed="right">
          <template #default="{ row }">
            <el-dropdown @command="(command) => updateStatus(row.id, command)">
              <el-button type="primary" size="small">
                更新状态
                <el-icon class="el-icon--right"><arrow-down /></el-icon>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item
                    v-for="item in statusOptions"
                    :key="item.value"
                    :command="item.value"
                    :disabled="row.status === item.value"
                  >
                    {{ item.label }}
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            
            <el-button
              type="danger"
              size="small"
              class="ml-2"
              @click="deleteFeedback(row.id)"
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
  </div>
</template>

<style scoped>
.feedbacks-manage {
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

@media screen and (max-width: 768px) {
  .feedbacks-manage {
    padding: 12px;
  }
  
  .filter-card :deep(.el-form-item) {
    margin-bottom: 12px;
  }
}
</style> 