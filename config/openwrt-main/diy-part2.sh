#!/bin/bash

# 默认ip
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改密码
sed -i 's/root:::0:99999:7:::/root:$1$SOP5eWTA$fJV8ty3QohO0chErhlxCm1:18775:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认主题
sed -i "/mediaurlbase/d" package/feeds/*/luci-theme*/root/etc/uci-defaults/*
sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-argon/root/etc/uci-defaults/30_luci-theme-argon
sed -i 's/luci-app-attendedsysupgrade/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile

## 删除软件
rm -rf feeds/luci/applications/luci-app-passwall

sed -i 's,kmod-r8169,kmod-r8168,g' target/linux/x86/image/64.mk
sed -i 's/256/1024/g' target/linux/x86/image/Makefile
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
# ------------------------------- Other started -------------------------------
#

svn co https://github.com/kiddin9/OpenWrt_x86-r2s-r4s-r5s-N1/trunk/devices/common/patches devices/common/patches
rm -rf devices/common/patches/.svn
svn co https://github.com/kiddin9/OpenWrt_x86-r2s-r4s-r5s-N1/trunk/devices/x86_64/patches devices/x86_64/patches
rm -rf devices/x86_64/patche/.svn

(
find "devices/common/patches" -type f ! -name 'china_mirrors.patch' -name '*.patch' ! -name '*.revert.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -B --merge -p1 -E --forward"
if [ -n "$(ls -A devices/x86_64/patches 2>/dev/null)" ]; then
      if [ -n "$(ls -A devices/x86_64/*.bin.patch 2>/dev/null)" ]; then
              git apply devices/x86_64/patches/*.bin.patch
      fi
      find "devices/x86_64/patches" -maxdepth 1 -type f -name '*.patch' ! -name '*.revert.patch' ! -name '*.bin.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -B --merge -p1 -E --forward"
      find "devices/x86_64/patches" -maxdepth 1 -type f -name '*.revert.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -R -B --merge -p1 -E --forward"
fi
) &
#
# ------------------------------- Other ends -------------------------------
