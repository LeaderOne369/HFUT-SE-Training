<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import request from '@/utils/request.js'

// 用户列表数据
const users = ref([])
const loading = ref(true)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

// 搜索和排序参数
const searchKeyword = ref('')
const sortConfig = ref({
  orderByColumn: 'id',
  sort: 'asc'
})

// 新建/编辑用户对话框
const dialogVisible = ref(false)
const dialogTitle = ref('')
const formData = ref({
  username: '',
  password: '',
  email: '',
  permissionLevel: 0
})
const formRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 4, max: 20, message: '长度在 4 到 20 个字符', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
  ]
}

// 获取用户列表
const getUsers = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: currentPage.value,
      pageSize: pageSize.value,
      orderByColumn: sortConfig.value.orderByColumn,
      sort: sortConfig.value.sort
    }
    
    // 添加搜索关键词
    if (searchKeyword.value) {
      params.username = searchKeyword.value
      params.email = searchKeyword.value
    }

    const response = await request.get('/api/admin/management/usermg/getSortedPage', {
      params
    })
    users.value = response.records
    total.value = response.total
  } catch (error) {
    console.error('获取用户列表失败:', error)
  } finally {
    loading.value = false
  }
}

// 处理搜索
const handleSearch = () => {
  currentPage.value = 1
  getUsers()
}

// 处理排序
const handleSortChange = ({ prop, order }) => {
  sortConfig.value.orderByColumn = prop
  sortConfig.value.sort = order === 'ascending' ? 'asc' : 'desc'
  getUsers()
}

// 处理页码改变
const handleCurrentChange = (page) => {
  currentPage.value = page
  getUsers()
}

// 处理每页条数改变
const handleSizeChange = (size) => {
  pageSize.value = size
  currentPage.value = 1
  getUsers()
}

// 打开新建用户对话框
const openCreateDialog = () => {
  dialogTitle.value = '新建用户'
  formData.value = {
    username: '',
    password: '',
    email: '',
    permissionLevel: 2
  }
  dialogVisible.value = true
}

// 创建用户
const createUser = async () => {
  try {
    await request.post('/api/admin/management/usermg/create', formData.value)
    ElMessage.success('创建用户成功')
    dialogVisible.value = false
    getUsers()
  } catch (error) {
    console.error('创建用户失败:', error)
  }
}

// 调整用户权限
const adjustPermission = async (id, level) => {
  try {
    await request.put(`/api/admin/management/usermg/${id}/permission-level`, null, {
      params: {
        permissionLevel: level
      }
    })
    ElMessage.success('调整权限成功')
    getUsers()
  } catch (error) {
    console.error('调整权限失败:', error)
  }
}

// 更新用户状态
const updateUserStatus = async (user) => {
  try {
    await request.put('/api/admin/management/usermg/update', {
      id: user.id,
      isFrozen: user.isFrozen === 1 ? 0 : 1
    })
    ElMessage.success('更新用户状态成功')
    getUsers()
  } catch (error) {
    console.error('更新用户状态失败:', error)
  }
}

// 删除用户
const deleteUser = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除该用户吗？此操作不可恢复', '警告', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await request.delete(`/api/admin/management/usermg/delete/${id}`)
    ElMessage.success('删除用户成功')
    getUsers()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除用户失败:', error)
    }
  }
}

onMounted(() => {
  getUsers()
})
</script>

<template>
  <div class="users-container">
    <!-- 工具栏 -->
    <div class="toolbar">
      <div class="left-actions">
        <el-button type="primary" @click="openCreateDialog">
          新建用户
        </el-button>
      </div>
      <div class="right-actions">
        <div class="search-box">
          <el-input
            v-model="searchKeyword"
            placeholder="搜索用户名或邮箱..."
            class="search-input"
            clearable
            @keyup.enter="handleSearch"
            @clear="handleSearch"
          >
            <template #append>
              <el-button @click="handleSearch">
                <el-icon><Search /></el-icon>
              </el-button>
            </template>
          </el-input>
        </div>
      </div>
    </div>

    <!-- 用户列表 -->
    <el-table
      :data="users"
      v-loading="loading"
      style="width: 100%"
      border
      @sort-change="handleSortChange"
    >
      <el-table-column label="权限" width="100" prop="permissionLevel" sortable="custom">
        <template #default="{ row }">
          <el-tag :type="row.permissionLevel === 1 ? 'warning' : 'info'">
            {{ row.permissionLevel === 1 ? '管理员' : '普通用户' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="用户信息" min-width="230" prop="username" sortable="custom">
        <template #default="{ row }">
          <div class="user-info">
            <el-avatar :size="40" :src="row.avatar" />
            <div class="user-details">
              <div class="username">{{ row.username }}</div>
              <div class="email">{{ row.email || '未设置邮箱' }}</div>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="phoneNumber" label="手机号" width="120" />
      <el-table-column label="关注/粉丝" width="200">
        <template #default="{ row }">
          <div class="follow-info">
            <span>关注 {{ row.followingCount || 0 }}</span>
            <el-divider direction="vertical" />
            <span>粉丝 {{ row.followersCount || 0 }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="registrationTime" label="注册时间" width="160" />
      <el-table-column prop="lastLoginTime" label="最后登录" width="160" />
      <el-table-column label="状态" width="100">
        <template #default="{ row }">
          <el-tag :type="row.isFrozen === 1 ? 'danger' : 'success'">
            {{ row.isFrozen === 1 ? '已冻结' : '正常' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="240" fixed="right">
        <template #default="{ row }">
          <el-button
            :type="row.isFrozen === 1 ? 'success' : 'warning'"
            size="small"
            @click="updateUserStatus(row)"
          >
            {{ row.isFrozen === 1 ? '解冻' : '冻结' }}
          </el-button>
          <el-button
            type="danger"
            size="small"
            @click="deleteUser(row.id)"
          >
            删除
          </el-button>
          <el-dropdown @command="(level) => adjustPermission(row.id, level)" class="ml-2">
            <el-button size="small">
              权限 <el-icon class="el-icon--right"><arrow-down /></el-icon>
            </el-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item :command="2">普通用户</el-dropdown-item>
                <el-dropdown-item :command="1">管理员</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
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
        :pager-count="7"
        prev-text="上一页"
        next-text="下一页"
      >
        <template #total>
          共 {{ total }} 条，第 {{ currentPage }}/{{ Math.ceil(total/pageSize) }} 页
        </template>
      </el-pagination>
    </div>

    <!-- 新建用户对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogTitle"
      width="500px"
    >
      <el-form
        ref="formRef"
        :model="formData"
        :rules="formRules"
        label-width="80px"
      >
        <el-form-item label="用户名" prop="username">
          <el-input v-model="formData.username" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="formData.password" type="password" />
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="formData.email" />
        </el-form-item>
        <el-form-item label="权限">
          <el-select v-model="formData.permissionLevel">
            <el-option label="普通用户" :value="2" />
            <el-option label="管理员" :value="1" />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="createUser">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.users-container {
  padding: 24px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.toolbar {
  margin-bottom: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #fff;
  padding: 12px 16px;
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
  flex-wrap: wrap;
  gap: 12px;
}

.left-actions {
  display: flex;
  gap: 8px;
}

.right-actions {
  display: flex;
  gap: 12px;
  align-items: center;
}

.search-box {
  display: flex;
  align-items: center;
}

.search-input {
  width: 300px;
}

:deep(.el-input-group__append) {
  padding: 0;
  .el-button {
    margin: 0;
    border: none;
    height: 32px;
    padding: 0 12px;
  }
}

/* 表格样式 */
:deep(.el-table) {
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
  background-color: #fff;
}

:deep(.el-table th) {
  background-color: #f5f7fa !important;
  color: #606266;
  font-weight: 500;
  border-bottom: 1px solid #ebeef5;
}

:deep(.el-table td) {
  border-bottom: 1px solid #ebeef5;
}

:deep(.el-table--border) {
  border: none;
}

:deep(.el-table--border th), :deep(.el-table--border td) {
  border-right: none;
}

/* 用户信息样式 */
.user-info {
  display: flex;
  align-items: center;
  gap: 8px;
}

.user-details {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.username {
  font-weight: 500;
  color: #303133;
  font-size: 14px;
  line-height: 1.4;
}

.email {
  font-size: 13px;
  color: #909399;
  line-height: 1.4;
}

/* 状态标签样式 */
:deep(.el-tag) {
  border-radius: 4px;
  padding: 0 8px;
}

/* 操作按钮样式 */
:deep(.el-button--small) {
  padding: 5px 12px;
  font-size: 13px;
}

/* 添加左边距类 */
.ml-2 {
  margin-left: 8px;
}

/* 分页样式 */
.pagination {
  margin-top: 16px;
  padding: 12px 16px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
  display: flex;
  justify-content: flex-end;
}

/* 头像样式 */
:deep(.el-avatar) {
  border: 1px solid #ebeef5;
  background-color: #f5f7fa;
}

/* 对话框样式 */
:deep(.el-dialog) {
  border-radius: 8px;
  overflow: hidden;
}

:deep(.el-dialog__header) {
  margin: 0;
  padding: 16px 20px;
  border-bottom: 1px solid #ebeef5;
}

:deep(.el-dialog__body) {
  padding: 20px;
}

:deep(.el-dialog__footer) {
  padding: 12px 20px;
  border-top: 1px solid #ebeef5;
}

/* 关注信息样式 */
.follow-info {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #606266;
  font-size: 13px;
}

:deep(.el-divider--vertical) {
  margin: 0;
  height: 12px;
}
</style> 