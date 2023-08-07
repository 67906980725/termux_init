#!/usr/bin/env bash

apt update
apt upgrade -y
pkg install termux-api
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
