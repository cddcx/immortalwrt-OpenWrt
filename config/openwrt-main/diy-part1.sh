#!/bin/bash

# 修改内核
sed -i 's/PATCHVER:=*.*/PATCHVER:=6.1/g' target/linux/x86/Makefile

sed -i "s?targets/%S/packages?targets/%S/\$(LINUX_VERSION)?" include/feeds.mk

sed -i '/	refresh_config();/d' scripts/feeds

sed -i '/$(curdir)\/compile:/c\$(curdir)/compile: package/opkg/host/compile' package/Makefile
sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite --force-depends/' package/Makefile

# 修改include/target.mk
sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk
sed -i "s/kmod-nft-offload/kmod-nft-offload kmod-nft-tproxy/" include/target.mk
sed -i "s/DEFAULT_PACKAGES:=/DEFAULT_PACKAGES:=luci-app-firewall luci-app-opkg \
luci-base luci-compat luci-lib-ipkg luci-lib-fs \
coremark wget-ssl curl autocore htop nano zram-swap kmod-lib-zstd kmod-tcp-bbr bash openssh-sftp-server block-mount resolveip ds-lite swconfig /" include/target.mk
sed -i "s/procd-ujail//" include/target.mk

sed -i "s/^.*vermagic$/\techo '1' > \$(LINUX_DIR)\/.vermagic/" include/kernel-defaults.mk

sed -i 's/Os/O2/g' include/target.mk

sed -i 's/=bbr/=cubic/' package/kernel/linux/files/sysctl-tcp-bbr.conf

sed -i 's/max_requests 3/max_requests 20/g' package/network/services/uhttpd/files/uhttpd.config

sed -i "s/tty\(0\|1\)::askfirst/tty\1::respawn/g" target/linux/*/base-files/etc/inittab

sed -i '/echo "radio_config_id=${radio_md5sum}" >> $hostapd_conf_file/d' package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh

# 添加软件源
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 修改target/linux/x86/Makefile
sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-usb-hid kmod-mmc kmod-sdhci usbutils pciutils lm-sensors-detect kmod-alx kmod-vmxnet3 kmod-igbvf kmod-iavf kmod-bnx2x kmod-pcnet32 kmod-tulip kmod-r8125 kmod-8139cp kmod-8139too kmod-i40e kmod-drm-i915 kmod-drm-amdgpu kmod-mlx4-core kmod-mlx5-core fdisk lsblk kmod-phy-broadcom/' target/linux/x86/Makefile
sed -i 's/grub2-bios-setup/grub2-bios-setup autocore default-settings ipset luci luci-app-udpxy luci-app-upnp luci-app-passwall2 luci-app-v2raya/g' target/linux/x86/Makefile

# luci-theme-argon改版主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

./scripts/feeds update -a
./scripts/feeds install -a
