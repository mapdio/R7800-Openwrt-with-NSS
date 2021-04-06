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

# 并入 lean插件包feeds和firewall
# git clone https://github.com/coolsnowwolf/lede
# cp -r lede/package/lean package/
# \cp lede/feeds.conf.default feeds.conf.default

# git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# wget -P target/linux/generic/hack-5.4 https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch

# 添加 ssr plus 和passwall 支持源
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small  https://github.com/kenzok8/small' feeds.conf.default


svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/default-settings package/lean/default-settings
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusic package/lean/UnblockNeteaseMusic
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusicGo package/lean/UnblockNeteaseMusicGo
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/baidupcs-web package/lean/baidupcs-web
# svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/openwrt-fullconenat package/lean/openwrt-fullconenat

svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/lean/luci-app-accesscontrol
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-baidupcs-web package/lean/luci-app-baidupcs-web
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-cpufreq package/lean/luci-app-cpufreq
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-flowoffload package/lean/luci-app-flowoffload
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-unblockmusic package/lean/luci-app-unblockmusic

mv package/lean/luci-app-cpufreq/po/zh-cn  package/lean/luci-app-cpufreq/po/zh_Hans
mv package/lean/luci-app-unblockmusic/po/zh-cn package/lean/luci-app-unblockmusic/po/zh_Hans
mv package/lean/luci-app-flowoffload/po/zh-cn package/lean/luci-app-flowoffload/po/zh_Hans
mv package/lean/luci-app-autoreboot/po/zh-cn package/lean/luci-app-autoreboot/po/zh_Hans
mv package/lean/luci-app-arpbind/po/zh-cn package/lean/luci-app-arpbind/po/zh_Hans
mv package/lean/luci-app-accesscontrol/po/zh-cn package/lean/luci-app-accesscontrol/po/zh_Hans

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
# rm -rf package/lean/ipt2socks
# rm -rf package/lean/dns2socks
# rm -rf package/lean/pdnsd-alt
# rm -rf package/lean/shadowsocksr-libev
# rm -rf package/lean/simple-obfs
# rm -rf package/lean/v2ray-plugin
# rm -rf package/lean/v2ray
# rm -rf package/lean/microsocks
# rm -rf package/lean/aria2
# rm -rf package/lean/minidlna



# 删除lede文件夹
# rm -rf lede

 cd package/lean
 git config --global user.email "r7800@openwrt.com"
 git config --global user.name "r7800"
 git init
 git add .
 git commit -m "添加lean 插件包 "
