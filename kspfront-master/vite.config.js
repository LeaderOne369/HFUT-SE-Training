import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueDevTools from 'vite-plugin-vue-devtools'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    vueDevTools(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
      'markdown-it': 'markdown-it/dist/markdown-it.min.js'
    },
  },
  server: {
    proxy: {
      '/api': {
        target: 'https://jg85768183.vicp.fun',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''), // 将请求路径中的 /api 移除
      },
    },
  },
})
