import api from "@/api/base-api.js";

const SectionApi = {
    // 获取所有分区
    async getAllSections() {
        return await api.get('/api/client/section/all');
    },

    // 获取分区下的标签
    async getTagsBySectionId(sectionId) {
        return await api.get(`/api/client/section/${sectionId}/tags`);
    },

    // 获取分区下的帖子
    async getPostsBySectionOrTag(sectionId, params) {
        return await api.get(`/api/client/section/${sectionId}/posts`, {
            params: {
                tagId: params.tagId,
                current: params.current || 1,
                size: params.size || 10
            }
        });
    },

    // 搜索分区下的帖子
    async searchPostsBySection(sectionId, params) {
        return await api.get(`/api/client/section/${sectionId}/posts/search`, {
            params: {
                keyword: params.keyword,
                current: params.current || 1,
                size: params.size || 10,
                sortBy: params.sortBy
            }
        });
    }
}

export default SectionApi; 