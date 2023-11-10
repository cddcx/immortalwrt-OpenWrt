#!/bin/bash

# 修改内核
sed -i 's/PATCHVER:=*.*/PATCHVER:=6.1/g' target/linux/x86/Makefile

# 修改include/target.mk
sed -i "s/kmod-nft-offload/kmod-nft-offload kmod-nft-tproxy/" include/target.mk

# 修改target/linux/x86/Makefile
sed -i 's/automount/autocore default-settings-chn ipset luci luci-compat luci-app-udpxy luci-app-upnp luci-app-passwall2 luci-app-v2raya/g' target/linux/x86/Makefile

# luci-app-ssr-plus
#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

# luci-app-passwall2
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"

# luci-theme-kucat
#git clone -b js https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
#sed -i '/set luci.main.mediaurlbase*/d' package/luci-theme-kucat/root/etc/uci-defaults/30_luci-kucat

./scripts/feeds update -a
./scripts/feeds install -a
