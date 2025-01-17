const Token = {

    setToken(token) {
        localStorage.setItem('token', token);
    },

    getToken() {
        return localStorage.getItem('token');
    },

    clearToken() {
        localStorage.removeItem('token');
    },

    removeToken() {
        localStorage.removeItem('token');
    },

    getUserId() {
        const token = this.getToken();
        if (!token) return null;
        
        try {
            // 从 JWT token 中解析用户 ID
            const base64Url = token.split('.')[1];
            const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            const payload = JSON.parse(window.atob(base64));
            return payload.userId;
        } catch (error) {
            console.error('解析 token 失败:', error);
            return null;
        }
    }

}

export default Token;