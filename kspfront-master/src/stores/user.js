import {defineStore} from 'pinia'
import {ref} from 'vue'

export const useUserStore = defineStore('user', () => {
    const user = ref(null)
    const permissions = ref([])

    const setUser = (userData) => {
        user.value = userData
    }

    const getUser = () => {
        return user.value
    }

    const setPermissions = (perms) => {
        permissions.value = perms
    }

    const getPermissions = () => {
        return permissions.value
    }

    const clearUser = () => {
        user.value = null
        permissions.value = []
    }

    return {
        user,
        permissions,
        setUser,
        getUser,
        setPermissions,
        getPermissions,
        clearUser
    }
})
