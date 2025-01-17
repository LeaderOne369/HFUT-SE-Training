<script setup>
import { ref, onMounted, onUnmounted, nextTick } from 'vue'
import request from '@/utils/request.js'
import * as echarts from 'echarts'
import {
  User,
  Document,
  ChatDotRound,
  Collection,
  Warning
} from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'

const stats = ref({
  userCount: 0,
  postCount: 0,
  commentCount: 0,
  sectionCount: 0
})

const loading = ref(true)
const timeScale = ref('DAY') // 默认显示日统计

const adminInfo = ref(null)

const chartInstance = ref(null)
const mapInstance = ref(null)
const chartData = ref({
  dates: [],
  users: [],
  views: [],
  comments: []
})

// 模拟用户分布数据
const mockUserLocations = [
  { 
    position: [117.197241, 31.775543],
    title: '117.197241°E, 31.775543°N', 
    count: 5 
  },
  { 
    position: [117.200876, 31.778251],
    title: '117.200876°E, 31.778251°N',
    count: 4
  },
  { 
    position: [117.195532, 31.776876],
    title: '117.195532°E, 31.776876°N',
    count: 4
  },
  { 
    position: [117.198843, 31.773234],
    title: '117.198843°E, 31.773234°N',
    count: 3
  },
  { 
    position: [117.193987, 31.774876],
    title: '117.193987°E, 31.774876°N',
    count: 3
  }
]

const fetchStat = async (field) => {
  try {
    const response = await request.post('/api/admin/statistics', {
      field: field,
      timeScale: timeScale.value
    })
    return response?.totalCount || 0
  } catch (error) {
    console.error(`获取${field}统计数据失败:`, error)
    return 0
  }
}

const getStats = async () => {
  try {
    const [userCount, postCount, commentCount, sectionCount] = await Promise.all([
      fetchStat('USER'),
      fetchStat('VIEW'),
      fetchStat('COMMENT'),
      fetchStat('SECTION')
    ])
    
    stats.value = {
      userCount,
      postCount,
      commentCount,
      sectionCount
    }
  } catch (error) {
    console.error('获取统计数据失败:', error)
    ElMessage.error('获取统计数据失败')
  } finally {
    loading.value = false
  }
}

// 获取图表数据
const getChartData = async () => {
  try {
    const [userTrend, viewTrend, commentTrend] = await Promise.all([
      request.post('/api/admin/statistics', {
        field: 'USER',
        timeScale: timeScale.value
      }),
      request.post('/api/admin/statistics', {
        field: 'VIEW',
        timeScale: timeScale.value
      }),
      request.post('/api/admin/statistics', {
        field: 'COMMENT',
        timeScale: timeScale.value
      })
    ])

    // 处理数据
    chartData.value = {
      dates: userTrend.timePoints || [],
      users: userTrend.counts || [],
      views: viewTrend.counts || [],
      comments: commentTrend.counts || []
    }

    // 使用 nextTick 确保 DOM 更新后再初始化图表
    nextTick(() => {
      initChart()
    })
  } catch (error) {
    console.error('获取图表数据失败:', error)
    ElMessage.error('获取图表数据失败')
  }
}

// 初始化图表
const initChart = () => {
  const chartDom = document.getElementById('statsChart')
  if (!chartDom) {
    console.warn('图表容器未找到')
    return
  }

  // 如果已经有实例，先销毁
  if (chartInstance.value) {
    chartInstance.value.dispose()
  }

  try {
    chartInstance.value = echarts.init(chartDom)
    const option = {
      title: {
        text: '数据趋势',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      legend: {
        data: ['用户数', '浏览量', '评论数'],
        bottom: '0%'
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '10%',
        top: '10%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: chartData.value.dates,
        axisLabel: {
          rotate: 45
        }
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          name: '用户数',
          type: 'line',
          smooth: true,
          data: chartData.value.users,
          itemStyle: {
            color: '#409EFF'
          }
        },
        {
          name: '浏览量',
          type: 'line',
          smooth: true,
          data: chartData.value.views,
          itemStyle: {
            color: '#67C23A'
          }
        },
        {
          name: '评论数',
          type: 'line',
          smooth: true,
          data: chartData.value.comments,
          itemStyle: {
            color: '#E6A23C'
          }
        }
      ]
    }

    chartInstance.value.setOption(option)
  } catch (error) {
    console.error('初始化图表失败:', error)
  }
}

// 处理窗口大小变化
const handleResize = () => {
  if (chartInstance.value) {
    chartInstance.value.resize()
  }
}

// 处理时间尺度变化
const handleTimeScaleChange = (scale) => {
  timeScale.value = scale
  getStats()
  getChartData()
}

// 获取管理员信息
const getAdminInfo = async () => {
  try {
    const response = await request.get('/api/admin/login/info')
 

    if (response.user) {
      adminInfo.value = response.user
    } else {
      ElMessage.error('获取管理员信息失败')
    }
  } catch (error) {
    console.error('获取管理员信息失败:', error)
    ElMessage.error('获取管理员信息失败')
  }
}

// 初始化高德地图
const initAMap = async () => {
  // 确保AMap已加载
  if (window.AMap) {
    // 确保容器存在
    const container = document.getElementById('amap-container')
    if (!container) {
      console.error('地图容器不存在')
      return
    }

    try {
      const map = new window.AMap.Map('amap-container', {
        zoom: 15,
        center: [117.197241, 31.775543],
        viewMode: '3D'
      })
      mapInstance.value = map

      // 等待插件加载
      await new Promise(resolve => {
        window.AMap.plugin(['AMap.HeatMap', 'AMap.ToolBar'], resolve)
      })

      // 添加工具条
      map.addControl(new window.AMap.ToolBar())

      // 添加标记点
      mockUserLocations.forEach(location => {
        const marker = new window.AMap.Marker({
          position: location.position,
          title: '用户位置',
          label: {
            content: `合肥工业大学翡翠湖校区\n${location.count}人`,
            direction: 'top'
          }
        })
        map.add(marker)
      })

      // 添加热力图
      const heatmap = new window.AMap.HeatMap(map, {
        radius: 50,
        opacity: [0, 0.8],
        gradient: {
          0.4: 'rgb(0, 255, 255)',
          0.65: 'rgb(0, 255, 0)',
          0.85: 'yellow',
          1.0: 'rgb(255, 0, 0)'
        },
        zooms: [3, 18]
      })
      
      // 转换数据格式为热力图所需格式
      const heatmapData = mockUserLocations.map(loc => ({
        lng: loc.position[0],
        lat: loc.position[1],
        count: loc.count
      }))
      
      heatmap.setDataSet({
        data: heatmapData,
        max: 6
      })

      // 自适应显示所有点位
      map.setFitView()
    } catch (error) {
      console.error('初始化地图失败:', error)
      ElMessage.error('初始化地图失败')
    }
  }
}

onMounted(async () => {
  await getAdminInfo()
  await getStats()
  
  // 加载高德地图脚本
  const script = document.createElement('script')
  script.src = `https://webapi.amap.com/maps?v=2.0&key=ef7ed442ff7ce6fe7ab8f920ca28002e&securityJsCode=4dd848aa45e5330bb1c25c8ba626bb10&plugin=AMap.HeatMap,AMap.ToolBar`
  script.async = true
  script.onload = () => {
    nextTick(() => {
      initAMap()
    })
  }
  document.head.appendChild(script)
  
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  if (chartInstance.value) {
    chartInstance.value.dispose()
  }
  if (mapInstance.value) {
    mapInstance.value.destroy()
  }
})
</script>

<template>
  <div class="dashboard">
    <!-- 工具栏 -->
    <div class="toolbar mb-4">
      <el-radio-group v-model="timeScale" @change="handleTimeScaleChange">
        <el-radio-button label="DAY">日</el-radio-button>
        <el-radio-button label="WEEK">周</el-radio-button>
        <el-radio-button label="MONTH">月</el-radio-button>
        <el-radio-button label="YEAR">年</el-radio-button>
      </el-radio-group>
    </div>

    <!-- 管理员信息卡片 -->
    <el-card class="admin-info-card mb-4" v-if="adminInfo">
      <div class="welcome-text">
        <el-avatar :size="50" :src="adminInfo.avatar" class="mr-3" />
        欢迎回来，{{ adminInfo.username }}
      </div>
      <div class="info-details">
        <div class="info-item">
          <span class="label">用户ID:</span>
          <span class="value">{{ adminInfo.id }}</span>
        </div>
        <div class="info-item">
          <span class="label">手机号:</span>
          <span class="value">{{ adminInfo.phoneNumber || '未设置' }}</span>
        </div>
        <div class="info-item">
          <span class="label">最后登录:</span>
          <span class="value">{{ adminInfo.lastLoginTime }}</span>
        </div>
        <div class="info-item">
          <span class="label">登录位置:</span>
          <span class="value">{{ adminInfo.lastLoginLocation }}</span>
        </div>
      </div>
    </el-card>

    <!-- 统计卡片和地图的布局 -->
    <el-row :gutter="24" class="stats-map-container">
      <!-- 左侧统计卡片 -->
      <el-col :span="8" class="left-stats">
        <el-row :gutter="24">
          <!-- 用户统计 -->
          <el-col :span="12" class="mb-4">
            <el-card shadow="hover" class="stat-card">
              <template #header>
                <div class="card-header">
                  <el-icon class="icon"><User /></el-icon>
                  <span>用户统计</span>
                </div>
              </template>
              <div class="card-content">
                <el-skeleton v-if="loading" :rows="1" animated />
                <template v-else>
                  <div class="stat-number">{{ stats.userCount }}</div>
                  <div class="stat-label">总用户数</div>
                </template>
              </div>
            </el-card>
          </el-col>
          
          <!-- 帖子统计 -->
          <el-col :span="12" class="mb-4">
            <el-card shadow="hover" class="stat-card">
              <template #header>
                <div class="card-header">
                  <el-icon class="icon"><Document /></el-icon>
                  <span>浏览统计</span>
                </div>
              </template>
              <div class="card-content">
                <el-skeleton v-if="loading" :rows="1" animated />
                <template v-else>
                  <div class="stat-number">{{ stats.postCount }}</div>
                  <div class="stat-label">总浏览数</div>
                </template>
              </div>
            </el-card>
          </el-col>
          
          <!-- 评论统计 -->
          <el-col :span="12" class="mb-4">
            <el-card shadow="hover" class="stat-card">
              <template #header>
                <div class="card-header">
                  <el-icon class="icon"><ChatDotRound /></el-icon>
                  <span>评论统计</span>
                </div>
              </template>
              <div class="card-content">
                <el-skeleton v-if="loading" :rows="1" animated />
                <template v-else>
                  <div class="stat-number">{{ stats.commentCount }}</div>
                  <div class="stat-label">总评论数</div>
                </template>
              </div>
            </el-card>
          </el-col>
          
          <!-- 分区统计 -->
          <el-col :span="12">
            <el-card shadow="hover" class="stat-card">
              <template #header>
                <div class="card-header">
                  <el-icon class="icon"><Collection /></el-icon>
                  <span>分区统计</span>
                </div>
              </template>
              <div class="card-content">
                <el-skeleton v-if="loading" :rows="1" animated />
                <template v-else>
                  <div class="stat-number">{{ stats.sectionCount }}</div>
                  <div class="stat-label">总分区数</div>
                </template>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </el-col>

      <!-- 右侧地图 -->
      <el-col :span="16">
        <el-card shadow="hover" class="map-card">
          <template #header>
            <div class="card-header">
              <span>用户位置分布</span>
            </div>
          </template>
          <div class="map-container">
            <div id="amap-container"></div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<style scoped>
.dashboard {
  padding: 16px;
  background-color: #f5f7fa;
  min-height: 100vh;
}

.stats-map-container {
  height: calc(100vh - 380px);
  min-height: 580px;
}

.toolbar {
  display: flex;
  justify-content: flex-end;
  padding: 0 8px;
  margin-bottom: 16px;
}

.admin-info-card {
  margin-bottom: 16px;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.welcome-text {
  display: flex;
  align-items: center;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 16px;
  color: #303133;
}

.mr-3 {
  margin-right: 12px;
}

.info-details {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 8px;
  background: #f8f9fb;
  padding: 8px 16px;
  border-radius: 6px;
}

.info-item .label {
  color: #909399;
  font-size: 13px;
}

.info-item .value {
  color: #303133;
  font-weight: 500;
  font-size: 13px;
}

.left-stats {
  height: 100%;
}

.left-stats .el-row {
  height: 100%;
}

.left-stats .el-col {
  height: 50%;
}

.stat-card {
  height: 86%;
  display: flex;
  flex-direction: column;
  border-radius: 8px;
  transition: all 0.3s;
  border: none;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.stat-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.1);
}

.card-header {
  padding: 12px 16px;
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  border-bottom: 1px solid #f0f0f0;
}

.icon {
  font-size: 18px;
}

.card-content {
  padding: 16px;
  text-align: center;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  background: linear-gradient(to bottom, #ffffff, #f8f9fb);
}

.stat-number {
  font-size: 32px;
  font-weight: 600;
  line-height: 1.1;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 13px;
  color: #909399;
}

.map-card {
  height: 95%;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.map-container {
  flex: 1;
  min-height: 400px;
  position: relative;
  border-radius: 0 0 8px 8px;
  overflow: hidden;
}

#amap-container {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
}

.mb-4 {
  margin-bottom: 16px;
}

/* 自定义每个统计卡片的颜色 */
:deep(.stat-card:nth-child(1)) .stat-number {
  color: #409EFF;
}

:deep(.stat-card:nth-child(2)) .stat-number {
  color: #67C23A;
}

:deep(.stat-card:nth-child(3)) .stat-number {
  color: #E6A23C;
}

:deep(.stat-card:nth-child(4)) .stat-number {
  color: #F56C6C;
}

@media screen and (max-width: 768px) {
  .dashboard {
    padding: 12px;
  }
  
  .stats-map-container {
    height: auto;
  }

  .map-container {
    height: 350px;
  }

  .stat-number {
    font-size: 24px;
  }

  .info-details {
    gap: 12px;
  }

  .info-item {
    padding: 6px 12px;
  }
}
</style> 