#!/bin/bash

SERVICE_NAME="wg-quick-service"
DESCRIPTION="启动 WireGuard 配置"
COMMAND="sudo wg-quick up ./wghub.conf"
USER="ubuntu"

echo "[Unit]
Description=$DESCRIPTION
After=network.target

[Service]
User=$USER
ExecStart=$COMMAND

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/$SERVICE_NAME.service

sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME.service
sudo systemctl start $SERVICE_NAME.service

echo "服务 $SERVICE_NAME 已创建并启动！"
