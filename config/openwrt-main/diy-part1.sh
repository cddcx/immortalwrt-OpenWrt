#!/bin/bash

# 修改内核
sed -i 's/PATCHVER:=*.*/PATCHVER:=6.1/g' target/linux/x86/Makefile

# 修改include/target.mk
sed -i "s/kmod-nft-offload/kmod-nft-offload kmod-nft-tproxy/" include/target.mk

# 修改target/linux/x86/Makefile
sed -i 's/automount/autocore default-settings-chn ipset luci luci-compat luci-app-udpxy luci-app-upnp luci-app-passwall2 luci-app-v2raya/g' target/linux/x86/Makefile

# luci-app-ssr-plus
#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

# 添加软件源
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
