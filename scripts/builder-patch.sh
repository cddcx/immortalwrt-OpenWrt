#!/bin/bash

echo "Start Builder Patch !"
echo "Current Path: $PWD"

cd openwrt || exit

# Remove redundant default packages
sed -i "/luci-app-cpufreq/d" include/target.mk

# Force opkg to overwrite files
sed -i "s/install \$(BUILD_PACKAGES)/install \$(BUILD_PACKAGES) --force-overwrite/" Makefile

# Not generate ISO images for it is too big
sed -i "s/CONFIG_ISO_IMAGES=y/# CONFIG_ISO_IMAGES is not set/" .config

# Not generate VHDX images
sed -i "s/CONFIG_VHDX_IMAGES=y/# CONFIG_VHDX_IMAGES is not set/" .config

# Not generate TARGET images GZIP
sed -i "s/CONFIG_TARGET_IMAGES_GZIP=y/# CONFIG_TARGET_IMAGES_GZIP is not set/" .config

# Not generate TARGET ROOTFS EXT4FS
sed -i "s/CONFIG_TARGET_ROOTFS_EXT4FS=y/# CONFIG_TARGET_ROOTFS_EXT4FS is not set/" .config

# Not generate TARGET ROOTFS TARGZ
sed -i "s/CONFIG_TARGET_ROOTFS_TARGZ=y/# CONFIG_TARGET_ROOTFS_TARGZ is not set/" .config

# Not generate TARGET_KERNEL_PARTSIZE
#sed -i "s/CONFIG_TARGET_KERNEL_PARTSIZE=*/CONFIG_TARGET_KERNEL_PARTSIZE=80/" .config

# Not generate TARGET_ROOTFS_PARTSIZE
#sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=*/CONFIG_TARGET_ROOTFS_PARTSIZE=600/" .config
