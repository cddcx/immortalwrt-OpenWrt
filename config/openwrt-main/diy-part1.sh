#!/bin/bash

# 修改内核
sed -i 's/PATCHVER:=*.*/PATCHVER:=6.1/g' target/linux/x86/Makefile

# 修改include/target.mk
sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk
sed -i "s/kmod-nft-offload/kmod-nft-offload kmod-nft-tproxy/" include/target.mk
sed -i "s/DEFAULT_PACKAGES:=/DEFAULT_PACKAGES:=luci-app-firewall luci-app-opkg \
luci-base luci-compat luci-lib-ipkg luci-lib-fs \
coremark wget-ssl curl autocore htop nano zram-swap kmod-lib-zstd kmod-tcp-bbr bash openssh-sftp-server block-mount resolveip ds-lite swconfig /" include/target.mk
sed -i "s/procd-ujail//" include/target.mk

# 添加软件源
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 修改target/linux/x86/Makefile
sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-usb-hid kmod-mmc kmod-sdhci usbutils pciutils lm-sensors-detect kmod-alx kmod-vmxnet3 kmod-igbvf kmod-iavf kmod-bnx2x kmod-pcnet32 kmod-tulip kmod-r8125 kmod-8139cp kmod-8139too kmod-i40e kmod-drm-i915 kmod-drm-amdgpu kmod-mlx4-core kmod-mlx5-core fdisk lsblk kmod-phy-broadcom/' target/linux/x86/Makefile
sed -i 's/grub2-bios-setup/grub2-bios-setup autocore default-settings ipset luci luci-app-udpxy luci-app-upnp luci-app-passwall2 luci-app-v2raya/g' target/linux/x86/Makefile

# luci-theme-argon改版主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

./scripts/feeds update -a
./scripts/feeds install -a
