# Netgear R7800 NSS 路由器固件自动编译 [![OpenWrt](https://img.shields.io/badge/From-OpenWrt-blue.svg?style=for-the-badge&logo=appveyor)](https://github.com/openwrt/openwrt) 
>固件来源：
[![Lean](https://img.shields.io/badge/Lede-Lean-red.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede) 
 [![Lienol](https://img.shields.io/badge/Package-Lienol-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt-package)  [![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/project-openwrt/openwrt) [![ClayMoreBoy](https://img.shields.io/badge/Mod-ClayMoreBoy-success.svg?style=flat&logo=appveyor)](https://github.com/ClayMoreBoy)


## 变量：

| 变量名 | 释义 |
| :--- | :--- |
| -- REPO_URL: https://github.com/ACwifidude/openwrt  | 定义源码 | 
| -- REPO_BRANCH: openwrt-21.02-nss-qsdk10.0 | 定义分支 |
| -- DIY_P1_SH: diy-part1.sh | 定义脚本文件 feed update 前 |
| -- DIY_P2_SH: diy-part2.sh | 定义脚本文件 feed install 后 |
| -- SSH_ACTION: false |是否打开 SSH |
| -- UPLOAD_FIRMWARE: true | 是否上传固件| 
| -- UPLOAD_COWTRANSFER: false | 是否上传固件到奶牛快传 |
| -- CREATE_RELEASE: true | 是否创建发行版本 Release |

| Actions Secrets名称 |
| :--- |
| RELEASE_TOKEN |
| EMAIL |


## 默认配置

| 默认配置 | IP | 用户名 | 密码 |
| :--- | :--- | :--- | :--- |
| 路由 & SSH | 192.168.10.1  | root | password |

## N7800 with NSS 固件下载
网件R7800：[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mapdio/R7800-Openwrt-with-NSS?style=for-the-badge&label=Download)](https://github.com/mapdio/R7800-Openwrt-with-NSS/releases/latest)

## 大雕LEAN的R21已经支持NSS，新的NSS固件下载
网件R7800：[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mapdio/R7800-LEAN-LEDE-NSS?style=for-the-badge&label=Download)](https://github.com/mapdio/R7800-LEAN-LEDE-NSS/releases/latest)

