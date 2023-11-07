#!/bin/bash

# 默认ip
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改密码
sed -i 's/root:::0:99999:7:::/root:$1$SOP5eWTA$fJV8ty3QohO0chErhlxCm1:18775:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认主题
sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-argon/root/etc/uci-defaults/30_luci-theme-argon
sed -i 's/luci-app-attendedsysupgrade/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

## 删除软件
#rm -rf feeds/luci/applications/luci-app-adguardhome
#rm -rf feeds/packages/net/adguardhome
#rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-smartdns
#rm -rf feeds/packages/net/smartdns
#rm -rf feeds/luci/applications/luci-app-ssr-plus

# Not generate TARGET images GZIP
#sed -i "s/CONFIG_TARGET_IMAGES_GZIP=y/# CONFIG_TARGET_IMAGES_GZIP is not set/" .config

# Not generate TARGET ROOTFS EXT4FS
#sed -i "s/CONFIG_TARGET_ROOTFS_EXT4FS=y/# CONFIG_TARGET_ROOTFS_EXT4FS is not set/" .config

# Not generate TARGET ROOTFS TARGZ
#sed -i "s/CONFIG_TARGET_ROOTFS_TARGZ=y/# CONFIG_TARGET_ROOTFS_TARGZ is not set/" .config

# Not generate TARGET_KERNEL_PARTSIZE
#sed -i "s/CONFIG_TARGET_KERNEL_PARTSIZE=*/CONFIG_TARGET_KERNEL_PARTSIZE=80/" .config

# Not generate TARGET_ROOTFS_PARTSIZE
#sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=*/CONFIG_TARGET_ROOTFS_PARTSIZE=600/" .config
