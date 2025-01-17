import axios from 'axios';
import {ElMessage} from "element-plus";
import Token from "@/stores/token.js";
import router from "@/router/index.js";


const api = axios.create({
    baseURL: import.meta.env.VITE_APP_API,
    timeout: 10000,
    headers: {
        'Content-Type': 'application/json',
    },
});

api.getApiUrl = () => {
    return import.meta.env.VITE_APP_API;
}

api.interceptors.request.use(
    (config) => {
        const token = Token.getToken();
        if (token) {
            config.headers['token'] = token
        }
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

api.interceptors.response.use(
    (response) => {
        console.log('API Response:', response.data);
        if (response.data.code === 401) {
            ElMessage.error('登录过期，请重新登录');
            Token.clearToken();
            router.push('/login');
            return Promise.reject(response.data.msg);
        }
        if (response.data.code !== 200) {
            ElMessage.error(response.data.msg);
            return Promise.reject(response.data.msg);
        }
        return response.data.data; // 直接返回数据，方便调用时处理
    },
    (error) => {
        console.error('API Request Error:', error);
        ElMessage.error('网络错误，请稍后再试');
        return Promise.reject(error);
    }
);

export default api;
