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
#sed -i "s/DEFAULT_PACKAGES:=/DEFAULT_PACKAGES:=luci-base luci-compat luci-lib-ipkg luci-lib-fs default-settings-chn luci \
coremark wget-ssl curl htop nano zram-swap kmod-lib-zstd kmod-tcp-bbr bash openssh-sftp-server block-mount resolveip ds-lite swconfig /" include/target.mk
#sed -i "s/ipv6helper/odhcp6c \
odhcpd-ipv6only/" include/target.mk
#sed -i "s/automount/autocore-x86 usbutils pciutils lm-sensors-detect fdisk lsblk \
luci-app-firewall luci-app-opkg luci-app-ssr-plus luci-app-openclash luci-app-udpxy luci-app-upnp/" target/linux/x86/Makefile

# 整理
#rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/themes/luci-theme-argon*

# 修改网络
#sed -i 's/eth0/eth0 eth2 eth3/' package/base-files/files/etc/board.d/99-default_network
#sed -i '2i # network config' package/emortal/default-settings/files/99-default-settings
#sed -i "3i uci set network.wan.proto='pppoe'" package/emortal/default-settings/files/99-default-settings
#sed -i "4i uci set network.wan.username='CD0283366379757'" package/emortal/default-settings/files/99-default-settings
#sed -i "5i uci set network.wan.password='19701115'" package/emortal/default-settings/files/99-default-settings
#sed -i "6i uci set network.wan.ifname='eth1'" package/emortal/default-settings/files/99-default-settings
#sed -i "7i uci set network.wan6.ifname='eth1'" package/emortal/default-settings/files/99-default-settings
#sed -i '8i uci commit network' package/emortal/default-settings/files/99-default-settings
