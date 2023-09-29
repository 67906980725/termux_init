#!/usr/bin/env bash

source ./cp_conf.sh

apt install -y rust rustc-dev
apt install -y binutils ndk-multilib ndk-multilib-native-static ndk-multilib-native-stubs ndk-sysroot clang

cp_conf_home ".cargo/config"