#! /bin/bash

echo "开始配置"

echo "安装 zsh"
# 备份原始 sources.list
echo "备份原始 sources.list 到 sources.list.bak"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# 写入新的源
echo "更新 /etc/apt/sources.list 文件..."
sudo tee /etc/apt/sources.list > /dev/null <<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirror.nyist.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirror.nyist.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirror.nyist.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirror.nyist.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirror.nyist.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirror.nyist.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

deb http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
EOF

# 更新 apt 缓存
echo "更新 apt 缓存..."
sudo apt update

# apt install zsh git curl -y
