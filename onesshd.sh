#!/bin/bash
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green "=========================================================="
 blue "首先，备份sshd配置文件，并将其文件名修改为sshd_config.back "
 blue "备份后的文件与原文件在同一个目录 "
green "=========================================================="
cpoy /etc/ssh/sshd_config /etc/ssh/sshd_config.back

green "=========================================================="
 blue "准备下载sshd配置文件，并修改VPS中的sshd_config "
green "=========================================================="
wget -N --no-check-certificate "https://raw.githubusercontent.com/hublinux/vps_ssh/master/sshd_config" && cat sshd_config > /etc/ssh/sshd_config

green "=========================================================="
blue "重新启动sshd服务 "
green "=========================================================="
systemctl restart sshd

green "=========================================================="
blue "更新你的root密码 "
green "=========================================================="
read -p "输入新的root密码:" passowrd
echo “$passowrd” | passwd –stdin root

green "=========================================================="
blue "运行完毕！你更新后的root是:$passowrd"
blue "现在用ssh远程连接工具登录试试吧！"
green "=========================================================="