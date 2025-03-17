#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 添加 timecontrol
git clone --depth 1 --single-branch https://github.com/sirpdboy/luci-app-timecontrol.git package/luci-app-timecontrol
sed -i 's/"admin", "control"/"admin", "services"/g' package/luci-app-timecontrol/luci-app-nft-timecontrol/luasrc/controller/timecontrol.lua
sed -i 's/"Control"/"Services"/g' package/luci-app-timecontrol/luci-app-nft-timecontrol/luasrc/controller/timecontrol.lua
sed -i 's/"admin", "control"/"admin", "services"/g' package/luci-app-timecontrol/luci-app-nft-timecontrol/luasrc/view/timecontrol/index.htm

# 修改 openvpn-server 至‘’标签
sed -i 's/"admin", "vpn"/"admin", "services"/g' package/feeds/luci/luci-app-openvpn-server/luasrc/controller/openvpn-server.lua
sed -i 's/"VPN"/"Services"/g' package/feeds/luci/luci-app-openvpn-server/luasrc/controller/openvpn-server.lua
sed -i 's/"admin", "vpn"/"admin", "services"/g' package/feeds/luci/luci-app-openvpn-server/luasrc/view/openvpn/openvpn_status.htm

# 修改版本为编译日期
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='ZN-M2 (build time: $(date +%Y%m%d))'/g"  package/base-files/files/etc/openwrt_release
