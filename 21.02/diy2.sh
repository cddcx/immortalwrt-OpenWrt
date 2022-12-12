#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================             

#设置默认时区
#uci set system.@system[0].timezone=CST-8
#uci set system.@system[0].zonename=Asia/Shanghai

# Docker v20.10.15
rm -rf feeds/packages/utils/docker
rm -rf feeds/packages/utils/docker-compose
rm -rf feeds/packages/utils/dockerd
rm -rf feeds/packages/utils/containerd
rm -rf feeds/packages/utils/coremark
rm -rf feeds/packages/utils/runc
rm -rf feeds/packages/utils/libnetwork
rm -rf package/feeds/luci/luci-app-dockerman
rm -rf package/feeds/luci/luci-lib-docker
rm -rf package/feeds/packages/docker-compose
rm -rf package/feeds/packages/dockerd
rm -rf feeds/xiangfeidexiaohuo/patch/autocore
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/smartdns

##配置IP
#sed -i 's/192.168.1.1/192.168.100.101/g' package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##替换theme icons
wget -O ./feeds/xiangfeidexiaohuo/jerrykuku/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://github.com/HiJwm/MySettings/raw/main/BackGround/2.jpg
svn co https://github.com/xylz0928/luci-mod/trunk/feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons ./package/lucimod
mv package/lucimod/* feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/

##更改主机名
#sed -i "s/hostname='.*'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
#sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='$(date +%Y%m%d) by HiJwm'/g" package/base-files/files/etc/openwrt_release #默认为openwrt版本号，无个人信息
#sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt-$(date +%Y%m%d) by HiJwm'/g"  package/base-files/files/etc/openwrt_release #编译文件中添加，这个就无效了

##把nas-packages-luci的zh-cn替换成zh_Hans
sed -i 's/("QuickStart")/("首页")/g' feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("NetworkGuide")/("网络向导")/g' feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("RAID")/("磁盘阵列")/g' feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("NetworkPort")/("网口配置")/g' feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/luasrc/controller/quickstart.lua
#cp -af feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/po/zh-cn feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/po/zh_Hans 
 
##修改openwrt的include/target.mk文件
sed -i 's/libustream-wolfssl/libustream-openssl/g' include/target.mk
sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk
sed -i 's/kmod-ipt-offload/block-mount coremark kmod-nf-nathelper kmod-nf-nathelper-extra kmod-ipt-raw kmod-tun dkmod-ipt-offload/g' include/target.mk
sed -i 's/ip6tables/ip6tables iptables-mod-tproxy iptables-mod-extra ipset ip-full default-settings luci luci-newapi/g' include/target.mk
sed -i 's/odhcp6c/odhcp6c ddns-scripts_aliyun ddns-scripts_dnspod/g' include/target.mk
sed -i 's/odhcpd-ipv6only/odhcpd-ipv6only curl ca-certificates luci-app-udpxy/g' include/target.mk

##修改openwrt/target/linux/x86的Makefile文件
sed -i 's/kmod-button-hotplug/kmod-alx kmod-e1000e kmod-igb kmod-igc kmod-igbvf kmod-iavf kmod-bnx2x kmod-pcnet32 kmod-tulip kmod-via-velocity kmod-vmxnet3 kmod-i40e kmod-i40evf kmod-r8125 kmod-8139cp kmod-8139too kmod-tg3 htop lm-sensors iperf3 ca-bundle kmod-sound-hda-core kmod-sound-hda-codec-realtek kmod-sound-hda-codec-via kmod-sound-via82xx kmod-sound-hda-intel kmod-sound-hda-codec-hdmi kmod-sound-i8x0 kmod-usb-audio kmod-usb-net kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152-vendor kmod-usb-net-aqc111 kmod-mlx4-core kmod-mlx5-core kmod-drm-i915 kmod-drm-amdgpu/g' target/linux/x86/Makefile
