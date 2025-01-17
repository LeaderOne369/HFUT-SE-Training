import api from "@/api/base-api.js";

const HomeApi = {

    async getRecommend(limit) {
        return await api.get('/api/client/homepage/recommend', {
            limit
        });
    }

}

export default HomeApi;