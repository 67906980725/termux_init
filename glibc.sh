#!/usr/bin/env bash
# 安装glibc
source ./cp_conf.sh

pkg ins pacman -y
github_proxy='https://download.nuaa.cf/'
arch='aarch64'
wget ${github_proxy}https://github.com/Maxython/glibc-for-termux/releases/download/20221025/gpft-20221025-${arch}.tar.xz
tar xJf gpft-20221025-${arch}.tar.xz
pacman -U glibc-for-termux/*
#grun --shell # 起一个可以访问 glibc 命令的shell
