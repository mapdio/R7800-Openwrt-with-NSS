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


cat >> feeds/luci/modules/luci-base/po/zh_Hans/base.po <<EOF

#: modules/luci-base/root/usr/share/luci/menu.d/luci-base.json:45
msgid "NAS"
msgstr "网络存储"
EOF





