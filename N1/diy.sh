#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

#修改密码
sed -i 's/^root:.*:/root:$1$KVHNuqbv$4X2BPbtsXn2AApknHIn38.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# => alist
rm -rf feeds/packages/lang/golang
rm -rf package/feeds/alist
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
git clone https://github.com/AlistGo/alist package/alist
git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist

# => 阿里ddns
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns

# => mihomo
git clone https://github.com/morytyann/OpenWrt-mihomo package/mihomo
