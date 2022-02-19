#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 移除ACwifidude自带bin目录
rm -rf bin
# 删除自带cpufreq配置
# rm -f target/linux/ipq806x/base-files/etc/init.d/cpufreq

# 并入 lean插件包feeds和firewall
# git clone https://github.com/coolsnowwolf/lede
# cp -r lede/package/lean package/
# \cp lede/feeds.conf.default feeds.conf.default

# git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# wget -P target/linux/generic/hack-5.4 https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch



# 添加 ssr plus 和passwall 支持源

sed -i '$a src-git leanpack https://github.com/coolsnowwolf/packages' feeds.conf.default
sed -i '$a src-git leanluci https://github.com/coolsnowwolf/luci' feeds.conf.default

cp -rf feeds/leanpack/* feeds/packages/
rm -rf feeds/leanpack

sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small  https://github.com/kenzok8/small' feeds.conf.default

svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/default-settings package/lean/default-settings


# sed -i '$a src-git OpenAppFilter https://github.com/OpenWrt-Actions/OpenAppFilter' feeds.conf.default



# 添加UPX UCL工具包
# cp -r lede/tools/upx tools
# cp -r lede/tools/ucl tools
mkdir -p tools/ucl && wget -P tools/ucl https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/ucl/Makefile
mkdir -p tools/upx && wget -P tools/upx https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/upx/Makefile

# 修改makefile
sed  -i '/^# builddir dependencies/i\tools-y += ucl upx' ./tools/Makefile
sed  -i '/^# builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' ./tools/Makefile
# sed  -i '/tools-$(CONFIG_TARGET_orion_generic)/atools-y += ucl upx' tools/Makefile
# sed  -i '/dependencies/a\\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile


# 删除重复插件
# rm -rf package/feeds/lean/ipt2socks
# rm -rf package/feeds/lean/dns2socks
# rm -rf package/feeds/lean/pdnsd-alt
# rm -rf package/feeds/lean/shadowsocksr-libev
# rm -rf package/feeds/lean/simple-obfs
# rm -rf package/feeds/lean/v2ray-plugin
# rm -rf package/feeds/lean/v2ray
# rm -rf package/feeds/lean/microsocks
# rm -rf package/feeds/lean/aria2
# rm -rf package/feeds/lean/minidlna

# rm -rf package/feeds/kenzok8/UnblockNeteaseMusic



# 删除lede文件夹
# rm -rf lede

 cd package/lean
 git config --global user.email "r7800@openwrt.com"
 git config --global user.name "r7800"
 git init
 git add .
 git commit -m "添加lean 插件包 "
