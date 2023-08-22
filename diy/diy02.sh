#!/bin/bash

#1. 默认ip
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改密码
sed -i 's/root:::0:99999:7:::/root:$1$SOP5eWTA$fJV8ty3QohO0chErhlxCm1:18775:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认主题
sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-app-attendedsysupgrade/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

## 删除软件
rm -rf feeds/luci/applications/luci-app-adguardhome
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/packages/net/smartdns

# 修改源码
#rm -rf include/target.mk
#rm -rf target/linux/x86/Makefile
#rm -rf package/network/config/firewall/makefile
#svn export https://github.com/coolsnowwolf/lede/trunk/include/target.mk include/
#svn export https://github.com/coolsnowwolf/lede/trunk/target/linux/x86/Makefile target/linux/x86/
#svn export https://github.com/coolsnowwolf/lede/trunk/package/network/config/firewall/makefile package/network/config/firewall/
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean package/lean

#sed -i '/For easy usage/d' include/target.mk
#sed -i '/DEFAULT_PACKAGES.tweak/d' include/target.mk
#sed -i '/autocore/d' include/target.mk
#sed -i '/block-mount/d' include/target.mk
#sed -i '/default-settings-chn/d' include/target.mk
#sed -i '/kmod-nf-nathelper/d' include/target.mk
#sed -i '/kmod-nf-nathelper-extra/d' include/target.mk
#sed -i '/luci-light/d' include/target.mk
#sed -i '/luci-app-cpufreq/d' include/target.mk
#sed -i '/luci-app-opkg/d' include/target.mk
#sed -i '/luci-compat/d' include/target.mk
#sed -i '/uci-lib-base/d' include/target.mk
#sed -i '/luci-lib-fs/d' include/target.mk
#sed -i '/luci-lib-ipkg/d' include/target.mk

# 整理
#rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf feeds/luci/themes/luci-theme-argon*
#rm -rf feeds/luci/applications/luci-app-v2raya
#rm -rf feeds/luci/applications/luci-app-v2ray-server
#rm -rf feeds/packages/net/v2raya
#rm -rf feeds/packages/net/v2ray-core
#rm -rf feeds/packages/net/v2ray-geodata
#rm -rf feeds/packages/net/v2ray-plugin
#rm -rf feeds/packages/net/xray-core
#rm -rf feeds/packages/net/xray-plugin

