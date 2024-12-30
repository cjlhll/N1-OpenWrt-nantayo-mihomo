#!/bin/bash

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.5.2/g' package/base-files/files/bin/config_generate

# 修改密码
sed -i 's/^root:.*:/root:$1$KVHNuqbv$4X2BPbtsXn2AApknHIn38.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# 删除默认 AList
rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/alist
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist

# 添加阿里云 DDNS
git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns

# 添加 Mihomo
git clone https://github.com/morytyann/OpenWrt-mihomo package/mihomo

# 添加 RustDesk 服务
mkdir -p files/etc/rustdesk

# 下载 RustDesk 服务器文件
wget -O rustdesk-server-linux-arm64v8.zip https://github.com/rustdesk/rustdesk-server/releases/latest/download/rustdesk-server-linux-arm64v8.zip

# 解压到临时目录
unzip rustdesk-server-linux-arm64v8.zip -d /tmp/rustdesk

# 移动子目录中的文件到指定目录
mv /tmp/rustdesk/arm64v8/hbbs /etc/rustdesk/hbbs
mv /tmp/rustdesk/arm64v8/hbbr /etc/rustdesk/hbbr

# 添加执行权限
chmod +x /etc/rustdesk/hbbs
chmod +x /etc/rustdesk/hbbr

# 配置系统启动脚本
cat >> files/etc/rc.local <<EOF
/etc/rustdesk/hbbs -r op.caojian.asia -k _ > /dev/null 2>&1 &
/etc/rustdesk/hbbr -k _ > /dev/null 2>&1 &
exit 0
EOF
