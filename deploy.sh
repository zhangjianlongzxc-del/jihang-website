#!/bin/bash

# 冀航智控航空官网 - 部署脚本
# 支持多种部署方式

echo "=========================================="
echo "冀航智控航空官网 - 部署工具"
echo "=========================================="
echo ""

# 检查部署方式
echo "请选择部署方式："
echo "1. GitHub Pages (需要GitHub账号，免费)"
echo "2. Netlify (需要账号，免费，最简单)"
echo "3. Vercel (需要账号，免费)"
echo ""
read -p "请输入选项 (1/2/3): " choice

case $choice in
    1)
        echo ""
        echo "=== GitHub Pages 部署 ==="
        echo ""
        echo "步骤："
        echo "1. 访问 https://github.com 并登录（如果没有账号请先注册）"
        echo "2. 点击右上角 + 号，选择 'New repository'"
        echo "3. 仓库名填写: jihang-website (或任意名称)"
        echo "4. 选择 Public，然后点击 'Create repository'"
        echo "5. 复制仓库的HTTPS地址（例如: https://github.com/你的用户名/jihang-website.git）"
        echo ""
        read -p "请输入GitHub仓库地址: " repo_url
        
        if [ -n "$repo_url" ]; then
            git remote add origin "$repo_url" 2>/dev/null || git remote set-url origin "$repo_url"
            git branch -M main
            git push -u origin main
            
            echo ""
            echo "✅ 代码已推送到GitHub！"
            echo ""
            echo "接下来："
            echo "1. 访问你的GitHub仓库页面"
            echo "2. 点击 Settings -> Pages"
            echo "3. Source 选择 'Deploy from a branch'"
            echo "4. Branch 选择 'main'，文件夹选择 '/'"
            echo "5. 点击 Save"
            echo "6. 等待几分钟，你的网站将在 https://你的用户名.github.io/jihang-website 上线"
        fi
        ;;
    2)
        echo ""
        echo "=== Netlify 部署 ==="
        echo ""
        echo "步骤："
        echo "1. 访问 https://app.netlify.com 并登录（如果没有账号请先注册，支持GitHub登录）"
        echo "2. 点击 'Add new site' -> 'Deploy manually'"
        echo "3. 将整个 website 文件夹拖拽到页面中"
        echo "4. 等待部署完成，网站会自动获得一个网址（例如: https://random-name-123.netlify.app）"
        echo ""
        echo "或者使用Netlify CLI："
        echo "运行: npm install -g netlify-cli"
        echo "然后: netlify deploy --prod"
        ;;
    3)
        echo ""
        echo "=== Vercel 部署 ==="
        echo ""
        echo "步骤："
        echo "1. 访问 https://vercel.com 并登录（如果没有账号请先注册，支持GitHub登录）"
        echo "2. 点击 'Add New Project'"
        echo "3. 导入你的GitHub仓库（需要先推送到GitHub）"
        echo "4. 或者使用CLI: vercel login 然后 vercel --prod"
        ;;
    *)
        echo "无效选项"
        ;;
esac

echo ""
echo "=========================================="
echo "部署说明完成！"
echo "=========================================="
