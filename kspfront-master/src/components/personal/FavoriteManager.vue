<script setup>
import { ref, onMounted, onBeforeUnmount, onUnmounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import PersonalFavoriteApi from '@/api/client/personal-favorite-api.js'
import PostItem from '@/components/PostItem.vue'
import { More, ArrowDown } from '@element-plus/icons-vue'
import request from '@/utils/request.js'

const folders = ref([])
const currentFolder = ref(null)
const favorites = ref([])
const loading = ref(false)
const showCreateDialog = ref(false)
const showEditDialog = ref(false)
const folderForm = ref({
  name: ''
})
const editingFolder = ref(null)
const folderFormRef = ref(null)
const folderFormRules = {
  name: [
    { required: true, message: '请输入收藏夹名称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ]
}

// 获取收藏夹列表
const getFolders = async () => {
  try {
    console.log('开始获取收藏夹列表')
    const response = await PersonalFavoriteApi.getFolderList()
    console.log('收藏夹列表数据:', response)
    
    if (response?.records) {
      const validFolders = response.records.filter(folder => !folder.isDeleted)
      folders.value = validFolders.map(folder => ({
        id: folder.id,
        folderName: folder.folderName || '未命名收藏夹',
        name: folder.folderName || '未命名收藏夹',
        favoriteCount: 0, // 初始化为0，后续获取实际数量
        createTime: folder.creationTime,
        isDeleted: folder.isDeleted
      }))
      // 按创建时间降序排序
      folders.value.sort((a, b) => new Date(b.createTime) - new Date(a.createTime))
      
      // 获取每个收藏夹的收藏数量
      await Promise.all(folders.value.map(async (folder) => {
        try {
          const favoriteResponse = await PersonalFavoriteApi.getFavoriteList(folder.id)
          console.log(`收藏夹${folder.id}数量响应:`, favoriteResponse)
          folder.favoriteCount = favoriteResponse?.total || 0
        } catch (error) {
          console.error(`获取收藏夹${folder.id}的收藏数量失败:`, error)
          folder.favoriteCount = 0
        }
      }))
      
      if (folders.value.length > 0 && !currentFolder.value) {
        currentFolder.value = folders.value[0]
        getFavorites(folders.value[0].id)
      }
    } else {
      folders.value = []
    }
  } catch (error) {
    console.error('获取收藏夹列表失败:', error)
    ElMessage.error('获取收藏夹列表失败')
    folders.value = []
  }
}

// 获取收藏列表
const getFavorites = async (folderId) => {
  if (!folderId) {
    console.log('没有选中的收藏夹')
    return
  }
  
  loading.value = true
  try {
    const response = await PersonalFavoriteApi.getFavoriteList(folderId)
    if (response?.records) {
      // 获取每个收藏项的帖子详情
      const favoritePromises = response.records.map(async (favorite) => {
        try {
          const postResponse = await request.get(`/api/client/post-detail/${favorite.postId}`)
          if (postResponse) {
            // 处理标签：如果是字符串则分割，如果是数组则直接使用
            const tags = postResponse.tags
            return {
              id: favorite.id,
              postId: favorite.postId,
              favoriteTime: favorite.favoriteTime,
              title: postResponse.title,
              content: postResponse.content,
              summary: postResponse.summary,
              cover: postResponse.cover,
              // tags: typeof tags === 'string' ? tags.split(',').map(tag => tag.trim()) : tags,
              userId: postResponse.authorId,
              username: postResponse.authorName,
              avatar: postResponse.authorAvatar,
              publishTime: postResponse.createTime,
              viewCount: postResponse.stats.viewCount,
              commentCount: postResponse.stats.commentCount,
              likeCount: postResponse.stats.likeCount,
              shareCount: postResponse.stats.shareCount,
              isEssence: false,
              sectionId: postResponse.sectionId,
              sectionName: postResponse.sectionName
            }
          }
          return null
        } catch (error) {
          console.error(`获取帖子${favorite.postId}详情失败:`, error)
          return null
        }
      })
      
      // 等待所有帖子详情获取完成，并过滤掉获取失败的帖子
      const favoritesWithDetails = (await Promise.all(favoritePromises)).filter(Boolean)
      favorites.value = favoritesWithDetails
      
    } else {
      favorites.value = []
    }
  } catch (error) {
    console.error('获取收藏列表失败:', error)
    ElMessage.error('获取收藏列表失败')
    favorites.value = []
  } finally {
    loading.value = false
  }
}

// 切换收藏夹
const handleFolderChange = (folder) => {
  currentFolder.value = folder
  getFavorites(folder.id)
}

// 创建收藏夹
const createFolder = async () => {
  console.log('开始创建收藏夹', folderForm.value)
  if (!folderFormRef.value) {
    console.log('表单引用不存在')
    return
  }
  
  try {
    await folderFormRef.value.validate()
    const requestData = {
      folderName: folderForm.value.name
    }
    console.log('表单验证通过，提交数据:', requestData)
    const response = await PersonalFavoriteApi.createFolder(requestData)
    console.log('创建收藏夹响应:', response)
    
    if (response && response.id) {
      ElMessage.success('创建成功')
      showCreateDialog.value = false
      folderForm.value = { name: '' }
      await getFolders()
    } else {
      throw new Error('创建收藏夹失败：响应数据无效')
    }
  } catch (error) {
    console.error('创建收藏夹失败:', error)
    if (error.message) {
      ElMessage.error(error.message)
    } else {
      ElMessage.error('创建收藏夹失败')
    }
  }
}

// 编辑收藏夹
const editFolder = async () => {
  try {
    const requestData = {
      id: editingFolder.value.id,
      folderName: folderForm.value.name
    }
    console.log('编辑收藏夹，提交数据:', requestData)
    await PersonalFavoriteApi.updateFolder(requestData)
    ElMessage.success('修改成功')
    showEditDialog.value = false
    await getFolders()
  } catch (error) {
    console.error('修改收藏夹失败:', error)
    ElMessage.error('修改收藏夹失败')
  }
}

// 删除收藏夹
const deleteFolder = async (folder) => {
  try {
    await ElMessageBox.confirm('确定要删除该收藏夹吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await PersonalFavoriteApi.deleteFolder(folder.id)
    ElMessage.success('删除成功')
    if (currentFolder.value?.id === folder.id) {
      currentFolder.value = null
      favorites.value = []
    }
    getFolders()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除收藏夹失败:', error)
      ElMessage.error('删除收藏夹失败')
    }
  }
}

// 移动收藏
const moveFavorite = async (favorite, targetFolderId) => {
  try {
    await PersonalFavoriteApi.moveFavorite(favorite.id, targetFolderId)
    ElMessage.success('移动成功')
    // 更新两个文件夹的收藏数量
    await getFolders()
    // 如果当前文件夹还有其他收藏，重新获取列表
    await getFavorites(currentFolder.value.id)
  } catch (error) {
    console.error('移动收藏失败:', error)
    ElMessage.error('移动收藏失败')
  }
}

// 删除收藏
const deleteFavorite = async (favorite) => {
  try {
    await ElMessageBox.confirm('确定要删除该收藏吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await PersonalFavoriteApi.deleteFavorite(favorite.id)
    ElMessage.success('删除成功')
    getFavorites(currentFolder.value.id)
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除收藏失败:', error)
      ElMessage.error('删除收藏失败')
    }
  }
}

// 打开编辑对话框
const openEditDialog = (folder) => {
  editingFolder.value = folder
  folderForm.value = {
    name: folder.folderName || folder.name
  }
  showEditDialog.value = true
}

onMounted(() => {
  getFolders()
})

// 修改组件卸载前的清理
onBeforeUnmount(async () => {
  // 等待下一个 tick，确保所有异步操作完成
  await nextTick()
  // 重置所有响应式数据
  folders.value = []
  favorites.value = []
  currentFolder.value = null
  loading.value = false
  showCreateDialog.value = false
  showEditDialog.value = false
  folderForm.value = {
    name: ''
  }
  editingFolder.value = null
  folderFormRef.value = null
})

// 修改组件卸载时的清理
onUnmounted(async () => {
  // 确保所有引用都被清理
  window.$currentInstance = null
  // 重置所有响应式状态
  loading.value = false
  showCreateDialog.value = false
  showEditDialog.value = false
})
</script>

<template>
  <div class="favorite-manager">
    <div class="folder-list">
      <div class="folder-header">
        <h3>收藏夹</h3>
        <el-button type="primary" @click="showCreateDialog = true" size="small">
          新建收藏夹
        </el-button>
      </div>
      
      <!-- 收藏夹列表 -->
      <div class="folders" v-if="folders.length > 0">
        <div
          v-for="folder in folders"
          :key="folder.id"
          class="folder-item"
          :class="{ active: currentFolder?.id === folder.id }"
          @click="handleFolderChange(folder)"
        >
          <div class="folder-info">
            <span class="folder-name">{{ folder.name }}</span>
            <span class="favorite-count">{{ folder.favoriteCount }}个内容</span>
          </div>
          <div class="folder-actions">
            <el-dropdown trigger="click" @command="command => command(folder)">
              <el-button size="small" text>
                <el-icon><More /></el-icon>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item :command="openEditDialog">编辑</el-dropdown-item>
                  <el-dropdown-item :command="deleteFolder" divided>删除</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </div>
      </div>

      <!-- 空状态 -->
      <div v-else class="empty-folders">
        <el-empty description="暂无收藏夹">
          <el-button type="primary" size="small" @click="showCreateDialog = true">
            新建收藏夹
          </el-button>
        </el-empty>
      </div>
    </div>

    <div class="favorite-list">
      <div class="favorite-header">
        <h3>{{ currentFolder?.name || '收藏列表' }}</h3>
      </div>

      <!-- 提示先创建收藏夹 -->
      <div v-if="!folders.length" class="no-folder-tip">
        <el-empty description="请先创建一个收藏夹" />
      </div>

      <!-- 骨架屏 -->
      <template v-else-if="loading">
        <div class="skeleton-container" v-for="i in 3" :key="i">
          <el-skeleton animated>
            <template #template>
              <div class="skeleton-item">
                <el-skeleton-item variant="image" style="width: 200px; height: 134px" />
                <div style="flex: 1; padding: 20px;">
                  <el-skeleton-item variant="h3" style="width: 50%" />
                  <div style="margin-top: 16px">
                    <el-skeleton-item variant="text" style="width: 60%" />
                  </div>
                </div>
              </div>
            </template>
          </el-skeleton>
        </div>
      </template>

      <!-- 收藏列表 -->
      <div v-else-if="favorites.length > 0" class="favorites">
        <div v-for="favorite in favorites" :key="favorite.id" class="favorite-item">
          <post-item :post="favorite" :isFavorite="true" />
          <div class="favorite-actions">
            <el-dropdown trigger="click" @command="(folderId) => moveFavorite(favorite, folderId)">
              <el-button size="small">
                移动到 <el-icon class="el-icon--right"><ArrowDown /></el-icon>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item
                    v-for="folder in folders"
                    :key="folder.id"
                    :disabled="folder.id === currentFolder?.id"
                    :command="folder.id"
                  >
                    {{ folder.name }}
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            <el-button type="danger" size="small" @click="deleteFavorite(favorite)">
              删除收藏
            </el-button>
          </div>
        </div>
      </div>

      <!-- 无数据提示 -->
      <el-empty v-else description="暂无收藏内容" />
    </div>

    <!-- 创建收藏夹对话框 -->
    <el-dialog
      v-model="showCreateDialog"
      title="新建收藏夹"
      width="400px"
      @close="folderFormRef?.resetFields()"
      destroy-on-close
    >
      <el-form
        ref="folderFormRef"
        :model="folderForm"
        :rules="folderFormRules"
        label-width="80px"
        status-icon
      >
        <el-form-item label="名称" prop="name">
          <el-input 
            v-model="folderForm.name" 
            placeholder="请输入收藏夹名称"
            maxlength="20"
            show-word-limit
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreateDialog = false">取消</el-button>
        <el-button type="primary" @click="createFolder">确定</el-button>
      </template>
    </el-dialog>

    <!-- 编辑收藏夹对话框 -->
    <el-dialog
      v-model="showEditDialog"
      title="编辑收藏夹"
      width="400px"
    >
      <el-form :model="folderForm" label-width="80px">
        <el-form-item label="名称" required>
          <el-input v-model="folderForm.name" placeholder="请输入收藏夹名称" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showEditDialog = false">取消</el-button>
        <el-button type="primary" @click="editFolder">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped>
.favorite-manager {
  display: flex;
  gap: 24px;
  min-height: 600px;
}

.folder-list {
  flex: 0 0 240px;
  background: #fff;
  border-radius: 8px;
  padding: 20px;
}

.folder-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.folder-header h3 {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
}

.folders {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.folder-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.folder-item:hover {
  background: #f5f7fa;
}

.folder-item.active {
  background: #ecf5ff;
}

.folder-info {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.folder-name {
  font-size: 14px;
  font-weight: 500;
  color: #1a1a1a;
}

.favorite-count {
  font-size: 12px;
  color: #909399;
}

.favorite-list {
  flex: 1;
  background: #fff;
  border-radius: 8px;
  padding: 20px;
}

.favorite-header {
  margin-bottom: 20px;
}

.favorite-header h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.folder-description {
  margin: 8px 0 0;
  font-size: 14px;
  color: #606266;
}

.favorites {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.favorite-item {
  position: relative;
}

.favorite-actions {
  display: flex;
  gap: 12px;
  margin-top: 12px;
}

.skeleton-container {
  margin-bottom: 16px;
}

.skeleton-item {
  display: flex;
  gap: 20px;
  padding: 20px;
  background: #f5f7fa;
  border-radius: 8px;
}

.empty-folders {
  padding: 20px 0;
  text-align: center;
}

.no-folder-tip {
  padding: 40px 0;
  text-align: center;
}

@media screen and (max-width: 768px) {
  .favorite-manager {
    flex-direction: column;
    gap: 16px;
  }

  .folder-list {
    flex: none;
    width: 100%;
    padding: 16px;
  }

  .favorite-list {
    padding: 16px;
  }

  .favorite-actions {
    flex-wrap: wrap;
  }
}
</style> 