#!/bin/bash
##############################################################
#                                                            #
# Author：Changed By Siemenstutorials                        #
#                                                            #
# Youtube channel:https://www.youtube.com/c/siemenstutorials #
#                                                            # 
# SHODOWSOCKS v1.0                                           #
#                                                            #
##############################################################
#Python3 install

rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
apt install python3 || yum install python3

#Shadowsocks pip3 install

pip3 install https://github.com/siemenstutorials/shadowsocksbackup/releases/download/v1.0/shadowsocks.zip -U

#Setting info

read -p "请设置Shodowsockss端口：" port
[ -z "${port}" ] && port=1168
echo "port = ${port}"
echo "-----------------------------------------------------"
read -p "请设置Shodowsockss协议：" method
[ -z "${method}" ] && method=aes-256-cfb
echo "method = ${method}"
echo "-----------------------------------------------------"
read -p "请设置Shodowsockss密码：" passwd
[ -z "${passwd}" ] && passwd=siemenstutorials
echo "passwd = ${passwd}"

#Nohup后台运行SS
nohup ssserver -m ${method} -p ${port} -k ${passwd} >> /dev/null 2>&1 & 

#Shadowsocks config

Shadowsocks_info() {
cat <<EOF
================================================
Connect details:
Server IP: 当前服务器IP | 密码: ${passwd} | 加密协议: ${method} | 端口: ${port}
================================================
EOF
}

echo "Shadowsocks安装完成"

