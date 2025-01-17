import api from "@/api/base-api.js";

const PersonalApi = {
    // 获取用户信息
    async getUserInfo() {
        return await api.get('/api/client/personal/center/info');
    },

    // 更新用户信息
    async updateUserInfo(userInfo) {
        return await api.put('/api/client/personal/center/info', userInfo);
    },

    // 上传头像
    async uploadAvatar(formData) {
        return await api.post('/api/client/personal/center/avatar', formData, {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        });
    },

    // 注销账号
    async deactivateAccount() {
        return await api.post('/api/client/personal/center/deactivate');
    }
}

export default PersonalApi;