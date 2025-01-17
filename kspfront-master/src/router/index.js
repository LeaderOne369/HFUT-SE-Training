import {createRouter, createWebHistory} from 'vue-router'
import HomeView from '@/views/client/HomeView.vue'
import {useUserStore} from "@/stores/user.js";
import Token from "@/stores/token.js";
import { ElMessage } from 'element-plus'
import request from '@/utils/request.js'
import AdminBaseView from '@/views/admin/AdminBaseView.vue'
import AdminLoginView from '@/views/admin/AdminLoginView.vue'
import AdminDashboardView from '@/views/admin/AdminDashboardView.vue'
import AdminUsersView from '@/views/admin/AdminUsersView.vue'
import AdminPostsView from '@/views/admin/AdminPostsView.vue'
import AdminCommentsView from '@/views/admin/AdminCommentsView.vue'
import AdminCollectionsView from '@/views/admin/AdminCollectionsView.vue'
import AdminFeedbacksView from '@/views/admin/AdminFeedbacksView.vue'
import AdminReviewsView from '@/views/admin/AdminReviewsView.vue'
import AdminReportsView from '@/views/admin/AdminReportsView.vue'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/login',
            name: 'login',
            component: () => import('@/views/client/LoginView.vue')
        },
        {
            path: '/',
            name: 'index',
            component: () => import('@/views/client/BaseView.vue'),
            redirect: '/home',
            children: [
                {
                    path: 'home',
                    name: 'home',
                    component: HomeView
                },
                {
                    path: 'post',
                    name: 'post',
                    component: () => import('@/views/client/EditPostView.vue'),
                    meta: { requiresAuth: true }
                },
                {
                    path: 'post/:id',
                    name: 'post-detail',
                    component: () => import('@/views/client/PostDetailView.vue')
                },
                {
                    path: 'category',
                    name: 'category',
                    component: () => import('@/views/client/CategoryView.vue')
                },
                {
                    path: 'rank',
                    name: 'rank',
                    component: () => import('@/views/client/RankView.vue')
                },
                {
                    path: 'personal',
                    name: 'personal',
                    component: () => import('@/views/client/PersonalView.vue'),
                    meta: { requiresAuth: true }
                },
                {
                    path: 'user/:id',
                    name: 'user-profile',
                    component: () => import('@/views/client/UserProfileView.vue')
                },
                {
                    path: 'register',
                    name: 'register',
                    component: () => import('@/views/client/RegisterView.vue')
                },
                {
                    path: 'ai',
                    name: 'ai',
                    component: () => import('@/views/client/AiAssistantView.vue'),
                    meta: { requiresAuth: true }
                },
                {
                    path: 'search',
                    name: 'search',
                    component: () => import('@/views/client/SearchView.vue')
                },
                {
                    path: 'help',
                    name: 'help',
                    component: () => import('@/views/client/HelpView.vue'),
                    meta: {
                        requiresAuth: false,
                        title: '帮助中心'
                    }
                },
                {
                    path: 'about',
                    name: 'about',
                    component: () => import('@/views/client/AboutView.vue'),
                    meta: {
                        requiresAuth: false,
                        title: '关于平台'
                    }
                },
                {
                    path: 'contact',
                    name: 'contact',
                    component: () => import('@/views/client/ContactView.vue'),
                    meta: {
                        requiresAuth: false,
                        title: '联系我们'
                    }
                },
                {
                    path: 'feedback',
                    name: 'feedback',
                    component: () => import('@/views/client/FeedbackView.vue'),
                    meta: {
                        requiresAuth: false,
                        title: '意见反馈'
                    }
                }
            ]
        },
        {
            path: '/admin/login',
            name: 'admin-login',
            component: AdminLoginView,
            meta: {
                title: '管理员登录'
            }
        },
        {
            path: '/admin',
            component: AdminBaseView,
            redirect: '/admin/dashboard',
            meta: {
                requiresAuth: true,
                requiresAdmin: true
            },
            children: [
                {
                    path: 'dashboard',
                    name: 'admin-dashboard',
                    component: AdminDashboardView,
                    meta: {
                        title: '仪表盘'
                    }
                },
                {
                    path: 'users',
                    name: 'admin-users',
                    component: AdminUsersView,
                    meta: {
                        title: '用户管理'
                    }
                },
                {
                    path: 'posts',
                    name: 'admin-posts',
                    component: AdminPostsView,
                    meta: {
                        title: '帖子管理'
                    }
                },
                {
                    path: 'comments',
                    name: 'admin-comments',
                    component: AdminCommentsView,
                    meta: {
                        title: '评论管理'
                    }
                },
                {
                    path: 'sections',
                    name: 'admin-collections',
                    component: AdminCollectionsView,
                    meta: {
                        title: '合集管理'
                    }
                },
                {
                    path: 'feedbacks',
                    name: 'admin-feedbacks',
                    component: AdminFeedbacksView,
                    meta: {
                        title: '反馈管理'
                    }
                },
                {
                    path: 'reviews',
                    name: 'admin-reviews',
                    component: AdminReviewsView,
                    meta: {
                        title: '审核管理'
                    }
                },
                {
                    path: 'reports',
                    name: 'admin-reports',
                    component: AdminReportsView,
                    meta: {
                        title: '举报管理'
                    }
                },
                {
                    path: 'notifications',
                    name: 'admin-notifications',
                    component: () => import('@/views/admin/NotificationsView.vue'),
                    meta: {
                        title: '通知管理'
                    }
                }
            ]
        }
    ],
})

router.beforeEach(async (to, from, next) => {
    // 设置页面标题
    if (to.meta.title) {
        document.title = `${to.meta.title} - 知识分享平台`
    }

    // 检查是否需要登录权限
    if (to.meta.requiresAuth) {
        const token = Token.getToken()
        const userStore = useUserStore()
        const user = userStore.getUser()

        if (!token) {
            // 未登录时静默跳转到登录页
            next('/login')
            return
        }

        // 如果有token但没有用户信息，尝试获取用户信息
        if (!user) {
            try {
                const response = await request.get('/api/client/login/info')
                if (response) {
                    userStore.setUser(response.user)
                    next()
                } else {
                    Token.removeToken()
                    next('/login')
                }
            } catch (error) {
                console.error('获取用户信息失败:', error)
                Token.removeToken()
                next('/login')
            }
            return
        }
    }

    // 如果是访问管理端页面
    if (to.path.startsWith('/admin')) {
        // 如果是访问管理员登录页，直接放行
        if (to.path === '/admin/login') {
            next()
            return
        }

        const token = Token.getToken()
        const userStore = useUserStore()
        const user = userStore.getUser()

        // 如果没有token，跳转到管理员登录页
        if (!token) {
            next('/admin/login')
            return
        }

        // 如果有token但没有用户信息，尝试获取用户信息
        if (!user) {
            try {
                const response = await request.get('/api/admin/login/info')
                if (response.code === 200 && response.data?.user) {
                    userStore.setUser(response.data.user)
                    userStore.setPermissions(response.data.permissions)
                    next()
                } else {
                    Token.removeToken()
                    next('/admin/login')
                }
            } catch (error) {
                console.error('获取用户信息失败:', error)
                Token.removeToken()
                next('/admin/login')
            }
            return
        }
    }

    // 其他情况直接放行
    next()
})

export default router
