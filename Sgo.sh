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
read -p "请设置Shodowsockss：aes-256-cfb协议：" method
[ -z "${method}" ] && method=aes-256-cfb
echo "method = ${method}"
echo "-----------------------------------------------------"
read -p "请设置Shodowsockss密码：" passwd
[ -z "${passwd}" ] && passwd=siemenstutorials
echo "passwd = ${passwd}"

#Nohup后台运行SS
nohup ssserver -m ${method} -p ${port} -k ${passwd} >> /dev/null 2>&1 & 

#Shadowsocks config

echo "Shadowsocks安装完成,连接信息如下"
echo "加密协议: " ${method}
echo "连接端口: " ${port}
echo "连接密码: " ${passwd}

