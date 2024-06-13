// 更新页面中的当前年份
function updateCurrentYear() {
    const currentYearElement = document.getElementById('currentYear');
    if (currentYearElement) {
        currentYearElement.textContent = new Date().getFullYear();
    }
}

// 页面加载完成后执行初始化操作
document.addEventListener('DOMContentLoaded', () => {
    updateCurrentYear(); // 更新当前年份
});
