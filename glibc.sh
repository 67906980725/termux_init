#!/usr/bin/env bash

source ./cp_conf.sh

pkg ins pacman -y
arch='aarch64' # aarch64 或 armv7
wget ${GITHUB_PROXY}https://github.com/Maxython/glibc-for-termux/releases/download/20221025/gpft-20221025-${arch}.tar.xz
tar xJf gpft-20221025-${arch}.tar.xz
pacman -U glibc-for-termux/*
