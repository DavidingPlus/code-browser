// 异步加载链接数据
async function fetchLinks() {
    try {
        const response = await fetch('./source/data/links.json');
        if (!response.ok) {
            throw new Error('Failed to fetch links data: ' + response.status);
        }
        const linksData = await response.json();
        generateLinks(linksData);
    } catch (error) {
        console.error('Error fetching links:', error.message);
    }
}

// 生成链接并添加到页面中
function generateLinks(linksData) {
    const linkContainer = document.getElementById('link-container');
    if (!linkContainer) {
        console.error('Element with id "link-container" not found');
        return;
    }

    linksData.forEach(linkData => {
        const linkElement = createLinkElement(linkData.href, linkData.text);
        linkContainer.appendChild(linkElement);
    });
}

// 创建单个链接元素
function createLinkElement(href, text) {
    const link = document.createElement('a');
    link.href = href;
    link.innerHTML = `<i class="fa fa-folder-open"></i> ${text}`;
    return link;
}

// 页面加载完成后执行初始化操作
document.addEventListener('DOMContentLoaded', () => {
    fetchLinks(); // 加载链接数据
});
