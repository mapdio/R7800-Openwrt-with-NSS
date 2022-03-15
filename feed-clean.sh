#!/bin/bash

# Description: OpenWrt DIY script run after Update feeds

cp -rf feeds/leanpack/multimedia/UnblockNeteaseMusic-Go feeds/packages/multimedia/UnblockNeteaseMusic-Go
cp -rf feeds/leanpack/multimedia/UnblockNeteaseMusic feeds/packages/multimedia/UnblockNeteaseMusic
cp -rf feeds/leanpack/net/baidupcs-web feeds/packages/net/baidupcs-web
cp -rf feeds/leanpack/net/dnsforwarder feeds/packages/net/dnsforwarder
cp -rf feeds/leanpack/net/dnsproxy feeds/packages/net/dnsproxy
cp -rf feeds/leanpack/net/pdnsd-alt feeds/packages/net/pdnsd-alt

rm -rf feeds/leanpack
./scripts/feeds update -a

# 移除feed里重复组件

rm -rf feeds/small/pdnsd-alt
# rm -rf feeds/packages/net/kcptun
# rm -rf feeds/kenzok8/redsocks2

# sed -i '/endef/a\TARGET_LDFLAGS+=-L$(STAGING_DIR)\/usr\/lib -L$(STAGING_DIR)\/lib' ./feeds/packages/lang/python/python3/files/python3-package-ctypes.mk
