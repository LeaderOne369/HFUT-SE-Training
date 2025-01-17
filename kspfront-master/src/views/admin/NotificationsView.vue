<template>
  <div class="notifications-view">
    <!-- 顶部操作栏 -->
    <div class="operation-bar">
      <el-button type="primary" @click="showSendDialog = true">
        发送通知
      </el-button>
      <div class="filters">
        <el-select v-model="queryParams.type" placeholder="通知类型" clearable>
          <el-option label="评论回复" :value="1" />
          <el-option label="点赞" :value="2" />
          <el-option label="系统通知" :value="3" />
        </el-select>
        <el-input
          v-model="queryParams.userId"
          placeholder="接收者ID"
          clearable
          @keyup.enter="handleSearch"
        />
        <el-button type="primary" @click="handleSearch">搜索</el-button>
        <el-button @click="resetQuery">重置</el-button>
      </div>
    </div>

    <!-- 通知列表 -->
    <el-table
      v-loading="loading"
      :data="notificationList"
      style="width: 100%"
      border
    >
      <el-table-column prop="id" label="ID" width="80" />
      <el-table-column prop="title" label="标题" min-width="150" show-overflow-tooltip />
      <el-table-column prop="content" label="内容" min-width="200" show-overflow-tooltip />
      <el-table-column prop="userReceiverId" label="接收者ID" width="100" />
      <el-table-column prop="type" label="类型" width="100">
        <template #default="{ row }">
          <el-tag :type="getNotificationTypeTag(row.type)">
            {{ getNotificationTypeText(row.type) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="status" label="状态" width="100">
        <template #default="{ row }">
          <el-tag :type="row.status === 0 ? 'warning' : 'success'">
            {{ row.status === 0 ? '未读' : '已读' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="creationTime" label="发送时间" width="180">
        <template #default="{ row }">
          {{ formatTime(row.creationTime) }}
        </template>
      </el-table-column>
      <el-table-column label="操作" width="120" fixed="right">
        <template #default="{ row }">
          <el-button
            type="danger"
            link
            @click="handleDelete(row.id)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <div class="pagination">
      <el-pagination
        v-model:current-page="queryParams.current"
        v-model:page-size="queryParams.size"
        :total="total"
        :page-sizes="[10, 20, 50, 100]"
        layout="total, sizes, prev, pager, next"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>

    <!-- 发送通知对话框 -->
    <el-dialog
      v-model="showSendDialog"
      title="发送通知"
      width="500px"
      @close="resetForm"
    >
      <el-form
        ref="formRef"
        :model="notificationForm"
        :rules="formRules"
        label-width="100px"
      >
        <el-form-item label="接收者ID" prop="userReceiverId">
          <el-input v-model.number="notificationForm.userReceiverId" />
        </el-form-item>
        <el-form-item label="通知类型" prop="type">
          <el-select v-model="notificationForm.type" placeholder="请选择通知类型">
            <el-option label="评论回复" :value="1" />
            <el-option label="点赞" :value="2" />
            <el-option label="系统通知" :value="3" />
          </el-select>
        </el-form-item>
        <el-form-item label="通知标题" prop="title">
          <el-input v-model="notificationForm.title" />
        </el-form-item>
        <el-form-item label="通知内容" prop="content">
          <el-input
            v-model="notificationForm.content"
            type="textarea"
            :rows="4"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showSendDialog = false">取消</el-button>
        <el-button type="primary" @click="handleSend" :loading="sending">
          发送
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import NotificationApi from '@/api/admin/notification-api'
import { formatTime } from '@/utils/format'

// 查询参数
const queryParams = reactive({
  current: 1,
  size: 10,
  type: undefined,
  userId: undefined
})

// 通知列表数据
const notificationList = ref([])
const total = ref(0)
const loading = ref(false)

// 发送通知表单
const showSendDialog = ref(false)
const sending = ref(false)
const formRef = ref(null)
const notificationForm = reactive({
  userReceiverId: undefined,
  type: undefined,
  title: '',
  content: ''
})

// 表单校验规则
const formRules = {
  userReceiverId: [
    { required: true, message: '请输入接收者ID', trigger: 'blur' },
    { type: 'number', message: '接收者ID必须为数字', trigger: 'blur' }
  ],
  type: [
    { required: true, message: '请选择通知类型', trigger: 'change' }
  ],
  title: [
    { required: true, message: '请输入通知标题', trigger: 'blur' },
    { min: 1, max: 50, message: '标题长度在1-50个字符之间', trigger: 'blur' }
  ],
  content: [
    { required: true, message: '请输入通知内容', trigger: 'blur' },
    { min: 1, max: 500, message: '内容长度在1-500个字符之间', trigger: 'blur' }
  ]
}

// 获取通知列表
const getList = async () => {
  loading.value = true
  try {
    const { records, total: totalCount } = await NotificationApi.getNotificationList({
      ...queryParams,
      userId: queryParams.userId ? Number(queryParams.userId) : undefined
    })
    notificationList.value = records
    total.value = totalCount
  } catch (error) {
    console.error('获取通知列表失败:', error)
    ElMessage.error('获取通知列表失败')
  } finally {
    loading.value = false
  }
}

// 发送通知
const handleSend = async () => {
  if (!formRef.value) return
  
  await formRef.value.validate(async (valid) => {
    if (valid) {
      sending.value = true
      try {
        await NotificationApi.sendNotification({
          ...notificationForm,
          status: 0,
          isDeleted: 0
        })
        ElMessage.success('发送成功')
        showSendDialog.value = false
        getList()
      } catch (error) {
        console.error('发送通知失败:', error)
        ElMessage.error('发送通知失败')
      } finally {
        sending.value = false
      }
    }
  })
}

// 删除通知
const handleDelete = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除这条通知吗？', '提示', {
      type: 'warning'
    })
    await NotificationApi.deleteNotification(id)
    ElMessage.success('删除成功')
    getList()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除通知失败:', error)
      ElMessage.error('删除通知失败')
    }
  }
}

// 搜索
const handleSearch = () => {
  queryParams.current = 1
  getList()
}

// 重置查询
const resetQuery = () => {
  queryParams.type = undefined
  queryParams.userId = undefined
  handleSearch()
}

// 重置表单
const resetForm = () => {
  if (formRef.value) {
    formRef.value.resetFields()
  }
}

// 处理分页
const handleSizeChange = (val) => {
  queryParams.size = val
  getList()
}

const handleCurrentChange = (val) => {
  queryParams.current = val
  getList()
}

// 获取通知类型文本
const getNotificationTypeText = (type) => {
  const types = {
    1: '评论回复',
    2: '点赞',
    3: '系统通知'
  }
  return types[type] || '未知'
}

// 获取通知类型标签样式
const getNotificationTypeTag = (type) => {
  const types = {
    1: 'success',
    2: 'warning',
    3: 'info'
  }
  return types[type] || ''
}

onMounted(() => {
  getList()
})
</script>

<style scoped>
.notifications-view {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.filters {
  display: flex;
  gap: 12px;
}

.pagination {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

:deep(.el-dialog__body) {
  padding-top: 20px;
}
</style> 