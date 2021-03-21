#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

mv package/luci-app-cpufreq/po/zh-cn  package/luci-app-cpufreq/po/zh-Hans
mv package/luci-app-unblockmusic/po/zh-cn package/luci-app-unblockmusic/po/zh-Hans
mv package/luci-app-flowoffload/po/zh-cn package/luci-app-flowoffload/po/zh-Hans
mv package/luci-app-autoreboot/po/zh-cn package/luci-app-autoreboot/po/zh-Hans
mv package/luci-app-arpbind/po/zh-cn package/luci-app-arpbind/po/zh-Hans
mv package/luci-app-accesscontrol/po/zh-cn package/luci-app-accesscontrol/po/zh-Hans


cat >> luci/modules/luci-base/po/zh-Hans/base.po <<EOF
msgid "NAS"
msgstr "网络存储"
EOF





