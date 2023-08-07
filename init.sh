#!/usr/bin/env bash

apt update
apt upgrade -y

apt install -y openssh
echo "请输入新ssh密码"
passwd

./zsh.sh
./glibc.sh

# ./rust.sh
# apt install -y sqlite
# apt install -y openjdk-17

echo "可以使用sshh命令开启ssh服务并显示连接命令"
echo "使用命令\"pkill sshd\"结束ssh服务"

echo "请在应用权限管理中手动给予termux存储权限"