/**
 * 格式化时间
 * @param {string} time - ISO格式的时间字符串
 * @returns {string} 格式化后的时间字符串
 */
export function formatTime(time) {
  if (!time) return ''
  
  const date = new Date(time)
  const now = new Date()
  const diff = now - date
  
  // 小于1分钟
  if (diff < 60 * 1000) {
    return '刚刚'
  }
  
  // 小于1小时
  if (diff < 60 * 60 * 1000) {
    return Math.floor(diff / (60 * 1000)) + '分钟前'
  }
  
  // 小于24小时
  if (diff < 24 * 60 * 60 * 1000) {
    return Math.floor(diff / (60 * 60 * 1000)) + '小时前'
  }
  
  // 小于30天
  if (diff < 30 * 24 * 60 * 60 * 1000) {
    return Math.floor(diff / (24 * 60 * 60 * 1000)) + '天前'
  }
  
  // 大于30天，显示具体日期
  const year = date.getFullYear()
  const month = (date.getMonth() + 1).toString().padStart(2, '0')
  const day = date.getDate().toString().padStart(2, '0')
  const hour = date.getHours().toString().padStart(2, '0')
  const minute = date.getMinutes().toString().padStart(2, '0')
  
  // 如果是今年，不显示年份
  if (year === now.getFullYear()) {
    return `${month}-${day} ${hour}:${minute}`
  }
  
  return `${year}-${month}-${day} ${hour}:${minute}`
}

/**
 * 格式化详细时间
 * @param {string} time - ISO格式的时间字符串
 * @returns {string} 格式化后的时间字符串 (YYYY-MM-DD HH:mm:ss)
 */
export function formatDetailTime(time) {
  if (!time) return ''
  
  const date = new Date(time)
  const year = date.getFullYear()
  const month = (date.getMonth() + 1).toString().padStart(2, '0')
  const day = date.getDate().toString().padStart(2, '0')
  const hour = date.getHours().toString().padStart(2, '0')
  const minute = date.getMinutes().toString().padStart(2, '0')
  const second = date.getSeconds().toString().padStart(2, '0')
  
  return `${year}-${month}-${day} ${hour}:${minute}:${second}`
} 