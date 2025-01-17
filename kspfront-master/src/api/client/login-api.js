import api from "@/api/base-api.js";

const LoinApi = {

    async loginByUsername(username, password) {
        return await api.post('/api/client/login', {
            username,
            password,
            loginType: '1'
        });
    },

    async loginByPhone(phoneNumber, password) {
        return await api.post('/api/client/login', {
            phoneNumber,
            password,
            loginType: '2'
        });
    },

    async loginByCaptcha(phoneNumber, captcha) {
        return await api.post('/api/client/login', {
            phoneNumber,
            captcha,
            loginType: '3'
        });
    },

    async sendCaptcha(phoneNumber) {
        return await api.post(`/api/client/login/captcha?phoneNumber=${phoneNumber}`);
    },

    async register(username, password, phoneNumber, captcha) {
        return await api.post('/api/client/login/register', {
            username,
            password,
            phoneNumber,
            captcha
        });
    }

}

export default LoinApi;