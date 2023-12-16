#!/usr/bin/env bash

apt update
apt upgrade -y
# https://wiki.termux.com/wiki/Termux-services
# https://blog.csdn.net/YiBYiH/article/details/127294017 
# $PREFIX/var/service/<your_service_name> 

# 要同时安装和 termux 同一证书(同一渠道下)的 termux-api.apk 并授予所有权限重启手机后才能正常使用 api
pkg install -y termux-api

# 创建 service 后如果启动服务报错就重启 termux, 启动服务后如果没生效就重启设备
pkg install -y termux-services

termux-setup-storage
echo "请在应用权限管理中手动给予termux存储权限"

./zsh.sh
./glibc.sh

# ./rust.sh
# apt install -y sqlite
# apt install -y openjdk-17

apt install -y openssh
echo "请输入新ssh密码"
passwd
echo "可以使用sshh命令开启ssh服务并显示连接命令"
echo "使用命令\"pkill sshd\"结束ssh服务"
