#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$KVHNuqbv$4X2BPbtsXn2AApknHIn38.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# => alist
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist package/alist

# => 阿里ddns
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns

# => mihomo
git clone https://github.com/morytyann/OpenWrt-mihomo package/mihomo

#主题
#rm -rf feeds/luci/themes/luci-theme-bootstrap
#git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

#sed -i 's/bootstrap/argon/g' package/feeds/luci/luci-light/Makefile
#sed -i 's/bootstrap/argon/g' package/feeds/luci/luci-nginx/Makefile
#sed -i 's/bootstrap/argon/g' package/feeds/luci/luci-ssl-nginx/Makefile

#cat feeds/luci/modules/luci-base/root/etc/config/luci
