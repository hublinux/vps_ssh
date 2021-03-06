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
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.back
sudo echo $?
green "=========================================================="
 blue "检查wget是否安装 "
green "=========================================================="
sudo apt install wget -y
sudo apt install vim -y
green "=========================================================="
 blue "准备下载sshd配置文件，并修改VPS中的sshd_config "
green "=========================================================="
sudo wget -N --no-check-certificate "https://raw.githubusercontent.com/hublinux/vps_ssh/master/sshd_config" && cat sshd_config > /etc/ssh/sshd_config
echo $?
green "=========================================================="
blue "重新启动sshd服务 "
green "=========================================================="
sudo systemctl restart sshd
echo $?
green "=========================================================="
blue "更新你的root密码 "
green "=========================================================="
sudo passwd root

green "=========================================================="
blue "运行完毕！root密码已经更新！"
blue "现在用ssh远程连接工具登录试试吧！"
green "=========================================================="
