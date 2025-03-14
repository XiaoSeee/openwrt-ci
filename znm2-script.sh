#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 添加 Parent Control
git clone --depth 1 --single-branch https://github.com/sirpdboy/luci-app-parentcontrol.git package/luci-app-parentcontrol

# 更改 Argon 主题背景
# cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 修改版本为编译日期
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt ZN-M2 (build time: $(date +%Y%m%d))'/g"  package/base-files/files/etc/openwrt_release