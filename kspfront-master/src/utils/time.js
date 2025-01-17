/**
 * 格式化时间
 * @param {string|number} time - 时间字符串或时间戳
 * @returns {string} 格式化后的时间字符串 (YYYY-MM-DD HH:mm:ss)
 */
export function formatTime(time) {
  if (!time) return ''
  
  const date = new Date(time)
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  const seconds = String(date.getSeconds()).padStart(2, '0')
  
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
}

export default {
  formatTime
} 