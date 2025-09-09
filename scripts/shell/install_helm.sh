#!/bin/bash

# Helm安装和服务配置脚本
set -e

echo "开始安装Helm..."
# 下载Helm安装脚本
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh

# 执行安装
./get_helm.sh

# 验证安装
helm version --short
echo "Helm安装完成！"

# 创建Helm系统服务
echo "配置Helm系统服务..."
cat > /etc/systemd/system/helm-service.service << 'EOF'
[Unit]
Description=Helm Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash -c "while true; do echo 'Helm service is running'; sleep 60; done"
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# 重新加载systemd配置
systemctl daemon-reload

# 启用并启动服务
systemctl enable helm-service
systemctl start helm-service

# 检查服务状态
echo "检查Helm服务状态..."
systemctl status helm-service --no-pager -l

echo "Helm安装和服务配置完成！"
echo "服务名称: helm-service"
echo "管理命令:"
echo "  sudo systemctl start helm-service"
echo "  sudo systemctl stop helm-service"
echo "  sudo systemctl status helm-service"