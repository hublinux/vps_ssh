# vps_ssh
一键修改Debian VPS的sshd配置文件，改完后，可以在ssh连接工具上连接vps

在VPS使用以下命令即可！

wget -N --no-check-certificate "https://raw.githubusercontent.com/hublinux/vps_ssh/master/onesshd.sh" && chmod +x onesshd.sh && ./onesshd.sh




Linux常用命令{
文件

ls -rtl                                    # 按时间倒叙列出所有目录和文件 ll -rt

touch file                                 # 创建空白文件

rm -rf dirname                             # 不提示删除非空目录(-r:递归删除 -f强制)

dos2unix                                   # windows文本转linux文本

unix2dos                                   # linux文本转windows文本

enca filename                              # 查看编码  安装 yum install -y enca

md5sum                                     # 查看md5值

ln sourcefile newfile                      # 硬链接

ln -s sourcefile newfile                   # 符号连接

readlink -f /data                          # 查看连接真实目录

cat file | nl |less                        # 查看上下翻页且显示行号  q退出

head                                       # 查看文件开头内容

head -c 10m                                # 截取文件中10M内容

split -C 10M                               # 将文件切割大小为10M -C按行

tail -f file                               # 查看结尾 监视日志文件

tail -F file                               # 监视日志并重试, 针对文件被mv的情况可以持续读取

file                                       # 检查文件类型

umask                                      # 更改默认权限

uniq                                       # 删除重复的行

uniq -c                                    # 重复的行出现次数

uniq -u                                    # 只显示不重复行

paste a b                                  # 将两个文件合并用tab键分隔开

paste -d'+' a b                            # 将两个文件合并指定'+'符号隔开

paste -s a                                 # 将多行数据合并到一行用tab键隔开

chattr +i /etc/passwd                      # 不得任意改变文件或目录 -i去掉锁 -R递归

more                                       # 向下分面器

locate aaa                                 # 搜索

wc -l file                                 # 查看行数

cp filename{,.bak}                         # 快速备份一个文件

\cp a b                                    # 拷贝不提示 既不使用别名 cp -i

rev                                        # 将行中的字符逆序排列

comm -12 2 3                               # 行和行比较匹配

echo "10.45aa" |cksum                      # 字符串转数字编码，可做校验，也可用于文件校验

iconv -f gbk -t utf8 source.txt > new.txt  # 转换编码

xxd /boot/grub/stage1                      # 16进制查看

hexdump -C /boot/grub/stage1               # 16进制查看

rename source new file                     # 重命名 可正则

watch -d -n 1 'df; ls -FlAt /path'         # 实时某个目录下查看最新改动过的文件

cp -v  /dev/dvd  /rhel4.6.iso9660          # 制作镜像

diff suzu.c suzu2.c  > sz.patch            # 制作补丁

patch suzu.c < sz.patch                    # 安装补丁

}

sort排序{

    -t                                     # 指定排序时所用的栏位分隔字符
    -n                                     # 依照数值的大小排序
    -r                                     # 以相反的顺序来排序
    -f                                     # 排序时，将小写字母视为大写字母
    -d                                     # 排序时，处理英文字母、数字及空格字符外，忽略其他的字符
    -c                                     # 检查文件是否已经按照顺序排序
    -b                                     # 忽略每行前面开始处的空格字符
    -M                                     # 前面3个字母依照月份的缩写进行排序
    -k                                     # 指定域
    -m                                     # 将几个排序好的文件进行合并
    -T                                     # 指定临时文件目录,默认在/tmp
    -o                                     # 将排序后的结果存入指定的文        

    sort -n                                # 按数字排序
    sort -nr                               # 按数字倒叙
    sort -u                                # 过滤重复行
    sort -m a.txt c.txt                    # 将两个文件内容整合到一起
    sort -n -t' ' -k 2 -k 3 a.txt          # 第二域相同，将从第三域进行升降处理
    sort -n -t':' -k 3r a.txt              # 以:为分割域的第三域进行倒叙排列
    sort -k 1.3 a.txt                      # 从第三个字母起进行排序
    sort -t" " -k 2n -u  a.txt             # 以第二域进行排序，如果遇到重复的，就删除

}

find查找{

    # linux文件无创建时间
    # Access 使用时间
    # Modify 内容修改时间
    # Change 状态改变时间(权限、属主)
    # 时间默认以24小时为单位,当前时间到向前24小时为0天,向前48-72小时为2天
    # -and 且 匹配两个条件 参数可以确定时间范围 -mtime +2 -and -mtime -4
    # -or 或 匹配任意一个条件

    find /etc -name "*http*"                                # 按文件名查找
    find . -type f                                          # 查找某一类型文件
    find / -perm                                            # 按照文件权限查找
    find / -user                                            # 按照文件属主查找
    find / -group                                           # 按照文件所属的组来查找文件
    find / -atime -n                                        # 文件使用时间在N天以内
    find / -atime +n                                        # 文件使用时间在N天以前
    find / -mtime +n                                        # 文件内容改变时间在N天以前
    find / -ctime +n                                        # 文件状态改变时间在N天前
    find / -mmin +30                                        # 按分钟查找内容改变
    find / -size +1000000c -print                           # 查找文件长度大于1M字节的文件
    find /etc -name "*passwd*" -exec grep "xuesong" {} \;   # 按名字查找文件传递给-exec后命令
    find . -name 't*' -exec basename {} \;                  # 查找文件名,不取路径
    find . -type f -name "err*" -exec  rename err ERR {} \; # 批量改名(查找err 替换为 ERR {}文件
    find path -name *name1* -or -name *name2*               # 查找任意一个关键字
    find  /etcnit.d/mysqld5.5 | xargs  sed -i '46 s_basedir=_basedir=\/server\/mysql-5.5_'    #查找替换高级用法

}

vim编辑器{

    # 常用配置
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    set noautoindent
    set nosmartindent
    set paste
    set clipboard=unnamed

    gconf-editor           # 配置编辑器
    /etc/vimrc             # 配置文件路径
    vim +24 file           # 打开文件定位到指定行
    vim file1 file2        # 打开多个文件
    vim  -r file           # 恢复上次异常关闭的文件 .file.swp 
    vim -O2 file1 file2    # 垂直分屏
    vim -on file1 file2    # 水平分屏
    Ctrl+ U                # 向前翻页
    Ctrl+ D                # 向后翻页
    Ctrl+ww                # 在窗口间切换
    Ctrl+w +or-or=         # 增减高度
    :sp filename           # 上下分割打开新文件
    :vs filename           # 左右分割打开新文件
    :set nu                # 打开行号
    :set nonu              # 取消行号
    :nohl                  # 取消高亮
    :set paste             # 取消缩进
    :set autoindent        # 设置自动缩进
    :set ff                # 查看文本格式
    :set binary            # 改为unix格式
    :%s/str/newstr/g       # 全部替换
    :200                   # 跳转到200  1 文件头
    G                      # 跳到行尾
    dd                     # 删除当前行 并复制 可直接p粘贴
    11111dd                # 删除11111行，可用来清空文件
    r                      # 替换单个字符
    R                      # 替换多个字符
    u                      # 撤销上次操作
    *                      # 全文匹配当前光标所在字符串
    $                      # 行尾
    0                      # 行首
    X                      # 文档加密
    v =                    # 自动格式化代码
    Ctrl+v                 # 可视模式
    Ctrl+v I ESC           # 多行操作
    Ctrl+v s ESC           # 批量取消注释

}

归档解压缩{

    tar zxvpf gz.tar.gz  dir                         # 解包指定tar.gz中的内容  不指定目录则全解压
    tar zcvpf /$path/gz.tar.gz *                     # 打包gz 注意*最好用相对路径
    tar zcf /$path/gz.tar.gz *                       # 打包正确不提示
    tar ztvpf gz.tar.gz                              # 查看gz
    tar xvf 1.tar -C dir                             # 解包tar 放到指定目录
    tar -cvf 1.tar *                                 # 打包tar
    tar tvf 1.tar                                    # 查看tar
    tar -rvf 1.tar filename                          # 给tar追加文件
    tar --exclude=/home/dmtsai --exclude=*.tar -zcvf myfile.tar.gz /home/* /etc      # 打包/home, /etc ，但排除 /home/dmtsai
    tar -N "2005/06/01" -zcvf home.tar.gz /home      # 在 /home 当中，比 2005/06/01 新的文件才备份
    tar -zcvfh home.tar.gz /home                     # 打包目录中包括连接目录
    tar zcf - ./ | ssh root@IP "tar zxf - -C /xxxx"  # 一边压缩一边解压
    zgrep str 1.gz                                   # 查看压缩包中文件字符行
    bzip2  -dv 1.tar.bz2                             # 解压bzip2
    bzip2 -v 1.tar                                   # bzip2压缩
    bzcat                                            # 查看bzip2
    gzip file                                        # 直接压缩文件 # 压缩后源文件消失
    gunzip file.gz                                   # 直接解压文件 # 解压后源文件消失
    gzip -r dir/                                     # 递归压缩目录
    gzip  -r -d dir/                                 # 递归解压目录
    gzip -dv 1.tar.gz                                # 解压gzip到tar
    gzip -v 1.tar                                    # 压缩tar到gz
    unzip zip.zip                                    # 解压zip
    zip zip.zip *                                    # 压缩zip
    rar a rar.rar *.jpg                              # 压缩文件为rar包
    unrar x rar.rar                                  # 解压rar包

}

文件ACL权限控制{

    getfacl 1.test                      # 查看文件ACL权限
    setfacl -R -m u:xuesong:rw- 1.test  # 对文件增加用户的读写权限 -R 递归

}

svn{

    --force # 强制覆盖
    /usr/bin/svn --username user --password passwd co  $Code  ${SvnPath}src/                 # 检出整个项目
    /usr/bin/svn --username user --password passwd up  $Code  ${SvnPath}src/                 # 更新项目
    /usr/bin/svn --username user --password passwd export  $Code$File ${SvnPath}src/$File    # 导出个别文件
    /usr/bin/svn --username user --password passwd export -r 版本号 svn路径 本地路径 --force   # 导出指定版本

}

git{

    git clone git@10.10.10.10:gittest.git  ./gittest/  # 克隆项目到指定目录
    git clone  -b develop --depth=1 http://git.a.com/d.git   # 克隆指定分支 克隆一层
    git status                                         # Show the working tree(工作树) status
    git log -n 1 --stat                                # 查看最后一次日志文件
    git branch -a                                      # 列出远程跟踪分支(remote-tracking branches)和本地分支
    git checkout developing                            # 切换到developing分支
    git checkout -b release                            # 切换分支没有从当前分支创建
    git checkout -b release origin/master              # 从远程分支创建本地镜像分支
    git push origin --delete release                   # 从远端删除分区，服务端有可能设置保护不允许删除
    git push origin release                            # 把本地分支提交到远程
    git pull                                           # 更新项目 需要cd到项目目录中
    git fetch -f -p                                    # 抓取远端代码但不合并到当前
    git reset --hard origin/master                     # 和远端同步分支
    git add .                                          # 更新所有文件
    git commit -m "gittest up"                         # 提交操作并添加备注
    git push                                           # 正式提交到远程git服务器
    git push [-u origin master]                        # 正式提交到远程git服务器(master分支)
    git tag [-a] dev-v-0.11.54 [-m 'fix #67']          # 创建tag,名为dev-v-0.11.54,备注fix #67
    git tag -l dev-v-0.11.54                           # 查看tag(dev-v-0.11.5)
    git push origin --tags                             # 提交tag
    git reset --hard                                   # 本地恢复整个项目
    git rm -r -n --cached  ./img                       # -n执行命令时,不会删除任何文件,而是展示此命令要删除的文件列表预览
    git rm -r --cached  ./img                          # 执行删除命令 需要commit和push让远程生效
    git init --bare smc-content-check.git              # 初始化新git项目  需要手动创建此目录并给git用户权限 chown -R git:git smc-content-check.git
    git config --global credential.helper store        # 记住密码
    git config [--global] user.name "your name"        # 设置你的用户名, 希望在一个特定的项目中使用不同的用户或e-mail地址, 不要--global选项
    git config [--global] user.email "your email"      # 设置你的e-mail地址, 每次Git提交都会使用该信息
    git config [--global] user.name                    # 查看用户名
    git config [--global] user.email                   # 查看用户e-mail
    git config --global --edit                         # 编辑~/.gitconfig(User-specific)配置文件, 值优先级高于/etc/gitconfig(System-wide)
    git config --edit                                  # 编辑.git/config(Repository specific)配置文件, 值优先级高于~/.gitconfig
    git cherry-pick  <commit id>                       # 用于把另一个本地分支的commit修改应用到当前分支 需要push到远程
    git log --pretty=format:'%h: %s' 9378b62..HEAD     # 查看指定范围更新操作 commit id
    git config --global core.ignorecase false          # 设置全局大小写敏感
    git ls-remote --heads origin refs/heads/test       # 查看

    从远端拉一份新的{
        # You have not concluded your merge (MERGE_HEAD exists)  git拉取失败
        git fetch --hard origin/master
        git reset --hard origin/master
    }

    删除远程分支并新建{
        git checkout master
        git branch -r -d origin/test       # 删除远程分支  但有时候并没有删除 可以尝试使用下面的语句
        git push origin :test              # 推送一个空分支到远程分支，相当于删除远程分支
        git branch -d test                 # 删除本地test分支, -D 强制
        git branch -a |grep test
        git checkout -b test
        git push origin test

        git reset --hard origin/test 
    }

    迁移git项目{
        git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
        git fetch --all
        git pull --all
        git remote set-url origin git@git.github.cn:server/gw.git
        git push --all
    }
}

恢复rm删除的文件{

    # debugfs针对 ext2   # ext3grep针对 ext3   # extundelete针对 ext4
    df -T   # 首先查看磁盘分区格式
    umount /data/     # 卸载挂载,数据丢失请首先卸载挂载,或重新挂载只读
    ext3grep /dev/sdb1 --ls --inode 2         # 记录信息继续查找目录下文件inode信息
    ext3grep /dev/sdb1 --ls --inode 131081    # 此处是inode
    ext3grep /dev/sdb1 --restore-inode 49153  # 记录下inode信息开始恢复目录

}

openssl{

    openssl rand 15 -base64            # 口令生成
    openssl sha1 filename              # 哈希算法校验文件
    openssl md5 filename               # MD5校验文件
    openssl base64   filename.txt      # base64编码/解码文件(发送邮件附件之类功能会可以使用)
    openssl base64 -d   filename.bin   # base64编码/解码二进制文件
    openssl enc -aes-128-cbc   filename.aes-128-cbc                  # 加密文档
    # 推荐使用的加密算法是bf(Blowfish)和-aes-128-cbc(运行在CBC模式的128位密匙AES加密算法)，加密强度有保障
    openssl enc -d -aes-128-cbc -in filename.aes-128-cbc > filename  # 解密文档

}
}

2 软件{

rpm{

    rpm -ivh lynx          # rpm安装
    rpm -e lynx            # 卸载包
    rpm -e lynx --nodeps   # 强制卸载
    rpm -qa                # 查看所有安装的rpm包
    rpm -qa | grep lynx    # 查找包是否安装
    rpm -ql                # 软件包路径
    rpm -Uvh               # 升级包
    rpm --test lynx        # 测试
    rpm -qc                # 软件包配置文档
    rpm --initdb           # 初始化rpm 数据库
    rpm --rebuilddb        # 重建rpm数据库  在rpm和yum无响应的情况使用 先 rm -f /var/lib/rpm/__db.00* 在重建

}

yum{

    yum list                 # 所有软件列表
    yum install 包名          # 安装包和依赖包
    yum -y update            # 升级所有包版本,依赖关系，系统版本内核都升级
    yum -y update 软件包名    # 升级指定的软件包
    yum -y upgrade           # 不改变软件设置更新软件，系统版本升级，内核不改变
    yum search mail          # yum搜索相关包
    yum grouplist            # 软件包组
    yum -y groupinstall "Virtualization"   # 安装软件包组
    repoquery -ql gstreamer  # 不安装软件查看包含文件
    yum clean all            # 清除var下缓存

}

yum使用epel源{

    # 包下载地址: http://download.fedoraproject.org/pub/epel   # 选择版本5\6\7
    rpm -Uvh  http://mirrors.hustunique.com/epel//6/x86_64/epel-release-6-8.noarch.rpm

    # 自适配版本
    yum install epel-release

}

自定义yum源{

    find /etc/yum.repos.d -name "*.repo" -exec mv {} {}.bak \;

    vim /etc/yum.repos.d/yum.repo
    [yum]
    #http
    baseurl=http://10.0.0.1/centos5.5
    #挂载iso
    #mount -o loop CentOS-5.8-x86_64-bin-DVD-1of2.iso /data/iso/
    #本地
    #baseurl=file:///data/iso/
    enable=1

    #导入key
    rpm --import  /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

}

编译{

    源码安装{

        ./configure --help                   # 查看所有编译参数
        ./configure  --prefix=/usr/local/    # 配置参数
        make                                 # 编译
        # make -j 8                          # 多线程编译,速度较快,但有些软件不支持
        make install                         # 安装包
        make clean                           # 清除编译结果

    }

    perl程序编译{

        perl Makefile.PL
        make
        make test
        make install

    }

    python程序编译{

        python file.py

        # 源码包编译安装
        python setup.py build
        python setup.py install

    }

    编译c程序{

        gcc -g hello.c -o hello

    }

}
}

3 系统{

wall                                          # 给其它用户发消息
whereis ls                                    # 搜索程序名，而且只搜索二进制文件
which                                         # 查找命令是否存在,及存放位置
locate                                        # 不是实时查找，查找的结果不精确，但查找速度很快 每天更新 /var/lib/locatedb
clear                                         # 清空整个屏幕
reset                                         # 重新初始化屏幕
cal                                           # 显示月历
echo -n 123456 | md5sum                       # md5加密
mkpasswd                                      # 随机生成密码   -l位数 -C大小 -c小写 -d数字 -s特殊字符
netstat -ntupl | grep port                    # 是否打开了某个端口
ntpdate cn.pool.ntp.org                       # 同步时间, pool.ntp.org: public ntp time server for everyone(http://www.pool.ntp.org/zh/)
tzselect                                      # 选择时区 #+8=(5 9 1 1) # (TZ='Asia/Shanghai'; export TZ)括号内写入 /etc/profile
/sbin/hwclock -w                              # 时间保存到硬件
/etc/shadow                                   # 账户影子文件
LANG=en                                       # 修改语言
vim /etc/sysconfig/i18n                       # 修改编码  LANG="en_US.UTF-8"
export LC_ALL=C                               # 强制字符集
vi /etc/hosts                                 # 查询静态主机名
alias                                         # 别名
watch uptime                                  # 监测命令动态刷新 监视
ipcs -a                                       # 查看Linux系统当前单个共享内存段的最大值
ldconfig                                      # 动态链接库管理命令
ldd `which cmd`                               # 查看命令的依赖库
dist-upgrade                                  # 会改变配置文件,改变旧的依赖关系，改变系统版本
/boot/grub/grub.conf                          # grub启动项配置
ps -mfL <PID>                                 # 查看指定进程启动的线程 线程数受 max user processes 限制
ps uxm |wc -l                                 # 查看当前用户占用的进程数 [包括线程]  max user processes
top -p  PID -H                                # 查看指定PID进程及线程
lsof |wc -l                                   # 查看当前文件句柄数使用数量  open files
lsof |grep /lib                               # 查看加载库文件
sysctl -a                                     # 查看当前所有系统内核参数
sysctl -p                                     # 修改内核参数/etc/sysctl.conf，让/etc/rc.d/rc.sysinit读取生效
strace -p pid                                 # 跟踪系统调用
ps -eo "%p %C  %z  %a"|sort -k3 -n            # 把进程按内存使用大小排序
strace uptime 2>&1|grep open                  # 查看命令打开的相关文件
grep Hugepagesize /proc/meminfo               # 内存分页大小
mkpasswd -l 8  -C 2 -c 2 -d 4 -s 0            # 随机生成指定类型密码
echo 1 > /proc/sys/net/ipv4/tcp_syncookies    # 使TCP SYN Cookie 保护生效  # "SYN Attack"是一种拒绝服务的攻击方式
grep Swap  /proc/25151/smaps |awk '{a+=$2}END{print a}'    # 查询某pid使用的swap大小
redir --lport=33060 --caddr=10.10.10.78 --cport=3306       # 端口映射 yum安装 用supervisor守护

开机启动脚本顺序{

    /etc/profile
    /etc/profile.d/*.sh
    ~/bash_profile
    ~/.bashrc
    /etc/bashrc

}

进程管理{

    ps -eaf               # 查看所有进程
    kill -9 PID           # 强制终止某个PID进程
    kill -15 PID          # 安全退出 需程序内部处理信号
    cmd &                 # 命令后台运行
    nohup cmd &           # 后台运行不受shell退出影响
    ctrl+z                # 将前台放入后台(暂停)
    jobs                  # 查看后台运行程序
    bg 2                  # 启动后台暂停进程
    fg 2                  # 调回后台进程
    pstree                # 进程树
    vmstat 1 9            # 每隔一秒报告系统性能信息9次
    sar                   # 查看cpu等状态
    lsof file             # 显示打开指定文件的所有进程
    lsof -i:32768         # 查看端口的进程
    renice +1 180         # 把180号进程的优先级加1
    exec sh a.sh          # 子进程替换原来程序的pid， 避免supervisor无法强制杀死进程

    ps{

        ps aux |grep -v USER | sort -nk +4 | tail       # 显示消耗内存最多的10个运行中的进程，以内存使用量排序.cpu +3
        # USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
        %CPU     # 进程的cpu占用率
        %MEM     # 进程的内存占用率
        VSZ      # 进程虚拟大小,单位K(即总占用内存大小,包括真实内存和虚拟内存)
        RSS      # 进程使用的驻留集大小即实际物理内存大小
        START    # 进程启动时间和日期
        占用的虚拟内存大小 = VSZ - RSS

        ps -eo pid,lstart,etime,args         # 查看进程启动时间

    }

    top{

        前五行是系统整体的统计信息。
        第一行: 任务队列信息，同 uptime 命令的执行结果。内容如下：
            01:06:48 当前时间
            up 1:22 系统运行时间，格式为时:分
            1 user 当前登录用户数
            load average: 0.06, 0.60, 0.48 系统负载，即任务队列的平均长度。
            三个数值分别为 1分钟、5分钟、15分钟前到现在的平均值。

        第二、三行:为进程和CPU的信息。当有多个CPU时，这些内容可能会超过两行。内容如下：
            Tasks: 29 total 进程总数
            1 running 正在运行的进程数
            28 sleeping 睡眠的进程数
            0 stopped 停止的进程数
            0 zombie 僵尸进程数
            Cpu(s): 0.3% us 用户空间占用CPU百分比
            1.0% sy 内核空间占用CPU百分比
            0.0% ni 用户进程空间内改变过优先级的进程占用CPU百分比
            98.7% id 空闲CPU百分比
            0.0% wa 等待输入输出的CPU时间百分比
            0.0% hi
            0.0% si

        第四、五行:为内存信息。内容如下：
            Mem: 191272k total 物理内存总量
            173656k used 使用的物理内存总量
            17616k free 空闲内存总量
            22052k buffers 用作内核缓存的内存量
            Swap: 192772k total 交换区总量
            0k used 使用的交换区总量
            192772k free 空闲交换区总量
            123988k cached 缓冲的交换区总量。
            内存中的内容被换出到交换区，而后又被换入到内存，但使用过的交换区尚未被覆盖，
            该数值即为这些内容已存在于内存中的交换区的大小。
            相应的内存再次被换出时可不必再对交换区写入。

        进程信息区,各列的含义如下:  # 显示各个进程的详细信息

        序号 列名    含义
        a   PID      进程id
        b   PPID     父进程id
        c   RUSER    Real user name
        d   UID      进程所有者的用户id
        e   USER     进程所有者的用户名
        f   GROUP    进程所有者的组名
        g   TTY      启动进程的终端名。不是从终端启动的进程则显示为 ?
        h   PR       优先级
        i   NI       nice值。负值表示高优先级，正值表示低优先级
        j   P        最后使用的CPU，仅在多CPU环境下有意义
        k   %CPU     上次更新到现在的CPU时间占用百分比
        l   TIME     进程使用的CPU时间总计，单位秒
        m   TIME+    进程使用的CPU时间总计，单位1/100秒
        n   %MEM     进程使用的物理内存百分比
        o   VIRT     进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
        p   SWAP     进程使用的虚拟内存中，被换出的大小，单位kb。
        q   RES      进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
        r   CODE     可执行代码占用的物理内存大小，单位kb
        s   DATA     可执行代码以外的部分(数据段+栈)占用的物理内存大小，单位kb
        t   SHR      共享内存大小，单位kb
        u   nFLT     页面错误次数
        v   nDRT     最后一次写入到现在，被修改过的页面数。
        w   S        进程状态。
            D=不可中断的睡眠状态
            R=运行
            S=睡眠
            T=跟踪/停止
            Z=僵尸进程 父进程在但并不等待子进程
        x   COMMAND  命令名/命令行
        y   WCHAN    若该进程在睡眠，则显示睡眠中的系统函数名
        z   Flags    任务标志，参考 sched.h

    }

    列出正在占用swap的进程{

        #!/bin/bash
        echo -e "PID\t\tSwap\t\tProc_Name"
        # 拿出/proc目录下所有以数字为名的目录（进程名是数字才是进程，其他如sys,net等存放的是其他信息）
        for pid in `ls -l /proc | grep ^d | awk '{ print $9 }'| grep -v [^0-9]`
        do
            # 让进程释放swap的方法只有一个：就是重启该进程。或者等其自动释放。放
            # 如果进程会自动释放，那么我们就不会写脚本来找他了，找他都是因为他没有自动释放。
            # 所以我们要列出占用swap并需要重启的进程，但是init这个进程是系统里所有进程的祖先进程
            # 重启init进程意味着重启系统，这是万万不可以的，所以就不必检测他了，以免对系统造成影响。
            if [ $pid -eq 1 ];then continue;fi
            grep -q "Swap" /proc/$pid/smaps 2>/dev/null
            if [ $? -eq 0 ];then
                swap=$(grep Swap /proc/$pid/smaps \
                    | gawk '{ sum+=$2;} END{ print sum }')
                proc_name=$(ps aux | grep -w "$pid" | grep -v grep \
                    | awk '{ for(i=11;i<=NF;i++){ printf("%s ",$i); }}')
                if [ $swap -gt 0 ];then
                    echo -e "${pid}\t${swap}\t${proc_name}"
                fi
            fi
        done | sort -k2 -n | awk -F'\t' '{
            pid[NR]=$1;
            size[NR]=$2;
            name[NR]=$3;
        }
        END{
            for(id=1;id<=length(pid);id++)
            {
                if(size[id]<1024)
                    printf("%-10s\t%15sKB\t%s\n",pid[id],size[id],name[id]);
                else if(size[id]<1048576)
                    printf("%-10s\t%15.2fMB\t%s\n",pid[id],size[id]/1024,name[id]);
                else
                    printf("%-10s\t%15.2fGB\t%s\n",pid[id],size[id]/1048576,name[id]);
            }
        }'

    }

    linux操作系统提供的信号{

        kill -l                    # 查看linux提供的信号
        trap "echo aaa"  2 3 15    # shell使用 trap 捕捉退出信号

        # 发送信号一般有两种原因:
        #   1(被动式)  内核检测到一个系统事件.例如子进程退出会像父进程发送SIGCHLD信号.键盘按下control+c会发送SIGINT信号
        #   2(主动式)  通过系统调用kill来向指定进程发送信号
        # 进程结束信号 SIGTERM 和 SIGKILL 的区别:  SIGTERM 比较友好，进程能捕捉这个信号，根据您的需要来关闭程序。在关闭程序之前，您可以结束打开的记录文件和完成正在做的任务。在某些情况下，假如进程正在进行作业而且不能中断，那么进程可以忽略这个SIGTERM信号。
        # 如果一个进程收到一个SIGUSR1信号，然后执行信号绑定函数，第二个SIGUSR2信号又来了，第一个信号没有被处理完毕的话，第二个信号就会丢弃。

        SIGHUP  1          A     # 终端挂起或者控制进程终止
        SIGINT  2          A     # 键盘终端进程(如control+c)
        SIGQUIT 3          C     # 键盘的退出键被按下
        SIGILL  4          C     # 非法指令
        SIGABRT 6          C     # 由abort(3)发出的退出指令
        SIGFPE  8          C     # 浮点异常
        SIGKILL 9          AEF   # Kill信号  立刻停止
        SIGSEGV 11         C     # 无效的内存引用
        SIGPIPE 13         A     # 管道破裂: 写一个没有读端口的管道
        SIGALRM 14         A     # 闹钟信号 由alarm(2)发出的信号
        SIGTERM 15         A     # 终止信号,可让程序安全退出 kill -15
        SIGUSR1 30,10,16   A     # 用户自定义信号1
        SIGUSR2 31,12,17   A     # 用户自定义信号2
        SIGCHLD 20,17,18   B     # 子进程结束自动向父进程发送SIGCHLD信号
        SIGCONT 19,18,25         # 进程继续（曾被停止的进程）
        SIGSTOP 17,19,23   DEF   # 终止进程
        SIGTSTP 18,20,24   D     # 控制终端（tty）上按下停止键
        SIGTTIN 21,21,26   D     # 后台进程企图从控制终端读
        SIGTTOU 22,22,27   D     # 后台进程企图从控制终端写

        缺省处理动作一项中的字母含义如下:
            A  缺省的动作是终止进程
            B  缺省的动作是忽略此信号，将该信号丢弃，不做处理
            C  缺省的动作是终止进程并进行内核映像转储(dump core),内核映像转储是指将进程数据在内存的映像和进程在内核结构中的部分内容以一定格式转储到文件系统，并且进程退出执行，这样做的好处是为程序员提供了方便，使得他们可以得到进程当时执行时的数据值，允许他们确定转储的原因，并且可以调试他们的程序。
            D  缺省的动作是停止进程，进入停止状况以后还能重新进行下去，一般是在调试的过程中（例如ptrace系统调用）
            E  信号不能被捕获
            F  信号不能被忽略
    }

    系统性能状态{

        vmstat 1 9

        r      # 等待执行的任务数。当这个值超过了cpu线程数，就会出现cpu瓶颈。
        b      # 等待IO的进程数量,表示阻塞的进程。
        swpd   # 虚拟内存已使用的大小，如大于0，表示机器物理内存不足，如不是程序内存泄露，那么该升级内存。
        free   # 空闲的物理内存的大小
        buff   # 已用的buff大小，对块设备的读写进行缓冲
        cache  # cache直接用来记忆我们打开的文件,给文件做缓冲，(把空闲的物理内存的一部分拿来做文件和目录的缓存，是为了提高 程序执行的性能，当程序使用内存时，buffer/cached会很快地被使用。)
        inact  # 非活跃内存大小，即被标明可回收的内存，区别于free和active -a选项时显示
        active # 活跃的内存大小 -a选项时显示
        si   # 每秒从磁盘读入虚拟内存的大小，如果这个值大于0，表示物理内存不够用或者内存泄露，要查找耗内存进程解决掉。
        so   # 每秒虚拟内存写入磁盘的大小，如果这个值大于0，同上。
        bi   # 块设备每秒接收的块数量，这里的块设备是指系统上所有的磁盘和其他块设备，默认块大小是1024byte
        bo   # 块设备每秒发送的块数量，例如读取文件，bo就要大于0。bi和bo一般都要接近0，不然就是IO过于频繁，需要调整。
        in   # 每秒CPU的中断次数，包括时间中断。in和cs这两个值越大，会看到由内核消耗的cpu时间会越多
        cs   # 每秒上下文切换次数，例如我们调用系统函数，就要进行上下文切换，线程的切换，也要进程上下文切换，这个值要越小越好，太大了，要考虑调低线程或者进程的数目,例如在apache和nginx这种web服务器中，我们一般做性能测试时会进行几千并发甚至几万并发的测试，选择web服务器的进程可以由进程或者线程的峰值一直下调，压测，直到cs到一个比较小的值，这个进程和线程数就是比较合适的值了。系统调用也是，每次调用系统函数，我们的代码就会进入内核空间，导致上下文切换，这个是很耗资源，也要尽量避免频繁调用系统函数。上下文切换次数过多表示你的CPU大部分浪费在上下文切换，导致CPU干正经事的时间少了，CPU没有充分利用。
        us   # 用户进程执行消耗cpu时间(user time)  us的值比较高时，说明用户进程消耗的cpu时间多，但是如果长期超过50%的使用，那么我们就该考虑优化程序算法或其他措施
        sy   # 系统CPU时间，如果太高，表示系统调用时间长，例如是IO操作频繁。
        id   # 空闲 CPU时间，一般来说，id + us + sy = 100,一般认为id是空闲CPU使用率，us是用户CPU使用率，sy是系统CPU使用率。
        wt   # 等待IOCPU时间。Wa过高时，说明io等待比较严重，这可能是由于磁盘大量随机访问造成的，也有可能是磁盘的带宽出现瓶颈。

        如果 r 经常大于4，且id经常少于40，表示cpu的负荷很重。
        如果 pi po 长期不等于0，表示内存不足。
        如果 b 队列经常大于3，表示io性能不好。

    }

}

日志管理{

    history                      # 历时命令默认1000条
    HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "   # 让history命令显示具体时间
    history  -c                  # 清除记录命令
    cat $HOME/.bash_history      # 历史命令记录文件
    lastb -a                     # 列出登录系统失败的用户相关信息  清空二进制日志记录文件 echo > /var/log/btmp
    last                         # 查看登陆过的用户信息  清空二进制日志记录文件 echo > /var/log/wtmp   默认打开乱码
    who /var/log/wtmp            # 查看登陆过的用户信息
    lastlog                      # 用户最后登录的时间
    tail -f /var/log/messages    # 系统日志
    tail -f /var/log/secure      # ssh日志

}

man{
    man 2 read   # 查看read函数的文档
    1 使用者在shell中可以操作的指令或可执行档
    2 系统核心可呼叫的函数与工具等
    3 一些常用的函数(function)与函数库(library),大部分是C的函数库(libc)
    4 装置档案的说明，通常在/dev下的档案
    5 设定档或者是某些档案的格式
    6 游戏games
    7 惯例与协定等，例如linux档案系统、网络协定、ascll code等说明
    8 系统管理员可用的管理指令
    9 跟kernel有关的文件
}

selinux{

    sestatus -v                    # 查看selinux状态
    getenforce                     # 查看selinux模式
    setenforce 0                   # 设置selinux为宽容模式(可避免阻止一些操作)
    semanage port -l               # 查看selinux端口限制规则
    semanage port -a -t http_port_t -p tcp 8000  # 在selinux中注册端口类型
    vi /etc/selinux/config         # selinux配置文件
    SELINUX=enfoceing              # 关闭selinux 把其修改为  SELINUX=disabled

}

查看剩余内存{

    free -m
    #-/+ buffers/cache:       6458       1649
    #6458M为真实使用内存  1649M为真实剩余内存(剩余内存+缓存+缓冲器)
    #linux会利用所有的剩余内存作为缓存，所以要保证linux运行速度，就需要保证内存的缓存大小

}

系统信息{

    uname -a              # 查看Linux内核版本信息
    cat /proc/version     # 查看内核版本
    cat /etc/issue        # 查看系统版本
    lsb_release -a        # 查看系统版本  需安装 centos-release
    locale -a             # 列出所有语系
    locale                # 当前环境变量中所有编码
    hwclock               # 查看时间
    who                   # 当前在线用户
    w                     # 当前在线用户
    whoami                # 查看当前用户名
    logname               # 查看初始登陆用户名
    uptime                # 查看服务器启动时间
    sar -n DEV 1 10       # 查看网卡网速流量
    dmesg                 # 显示开机信息
    lsmod                 # 查看内核模块

}

硬件信息{

    more /proc/cpuinfo                                       # 查看cpu信息
    lscpu                                                    # 查看cpu信息
    cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c    # 查看cpu型号和逻辑核心数
    getconf LONG_BIT                                         # cpu运行的位数
    cat /proc/cpuinfo | grep 'physical id' |sort| uniq -c    # 物理cpu个数
    cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l     # 结果大于0支持64位
    cat /proc/cpuinfo|grep flags                             # 查看cpu是否支持虚拟化   pae支持半虚拟化  IntelVT 支持全虚拟化
    more /proc/meminfo                                       # 查看内存信息
    dmidecode                                                # 查看全面硬件信息
    dmidecode | grep "Product Name"                          # 查看服务器型号
    dmidecode | grep -P -A5 "Memory\s+Device" | grep Size | grep -v Range       # 查看内存插槽
    cat /proc/mdstat                                         # 查看软raid信息
    cat /proc/scsi/scsi                                      # 查看Dell硬raid信息(IBM、HP需要官方检测工具)
    lspci                                                    # 查看硬件信息
    lspci|grep RAID                                          # 查看是否支持raid
    lspci -vvv |grep Ethernet                                # 查看网卡型号
    lspci -vvv |grep Kernel|grep driver                      # 查看驱动模块
    modinfo tg2                                              # 查看驱动版本(驱动模块)
    ethtool -i em1                                           # 查看网卡驱动版本
    ethtool em1                                              # 查看网卡带宽

}

终端快捷键{

    Ctrl+A        　    # 行前
    Ctrl+E        　    # 行尾
    Ctrl+S        　    # 终端锁屏
    Ctrl+Q        　　  # 解锁屏
    Ctrl+D      　　    # 退出

}

开机启动模式{

    vi /etc/inittab
    id:3:initdefault:    # 3为多用户命令
    #ca::ctrlaltdel:/sbin/shutdown -t3 -r now   # 注释此行 禁止 ctrl+alt+del 关闭计算机

}

终端提示显示{

    echo $PS1                   # 环境变量控制提示显示
    PS1='[\u@ \H \w \A \@#]\$'
    PS1='[\u@\h \W]\$'
    export PS1='[\[\e[32m\]\[\e[31m\]\u@\[\e[36m\]\h \w\[\e[m\]]\$ '     # 高亮显示终端

}

定时任务{

    at 5pm + 3 days /bin/ls  # 单次定时任务 指定三天后下午5:00执行/bin/ls

    crontab -e               # 编辑周期任务
    #分钟  小时    天  月  星期   命令或脚本
    1,30  1-3/2    *   *   *      命令或脚本  >> file.log 2>&1
    echo "40 7 * * 2 /root/sh">>/var/spool/cron/work    # 普通用户可直接写入定时任务
    crontab -l                                          # 查看自动周期性任务
    crontab -r                                          # 删除自动周期性任务
    cron.deny和cron.allow                               # 禁止或允许用户使用周期任务
    service crond start|stop|restart                    # 启动自动周期性服务
    * * * * *  echo "d" >>d$(date +\%Y\%m\%d).log       # 让定时任务直接生成带日期的log  需要转义%

}

date{

    星期日[SUN] 星期一[MON] 星期二[TUE] 星期三[WED] 星期四[THU] 星期五[FRI] 星期六[SAT]
    一月[JAN] 二月[FEB] 三月[MAR] 四月[APR] 五月[MAY] 六月[JUN] 七月[JUL] 八月[AUG] 九月[SEP] 十月[OCT] 十一月[NOV] 十二月[DEC]

    date -s 20091112                     # 设日期
    date -s 18:30:50                     # 设时间
    date -d "7 days ago" +%Y%m%d         # 7天前日期
    date -d "5 minute ago" +%H:%M        # 5分钟前时间
    date -d "1 month ago" +%Y%m%d        # 一个月前
    date -d '1 days' +%Y-%m-%d           # 一天后
    date -d '1 hours' +%H:%M:%S          # 一小时后
    date +%Y-%m-%d -d '20110902'         # 日期格式转换
    date +%Y-%m-%d_%X                    # 日期和时间
    date +%N                             # 纳秒
    date -d "2012-08-13 14:00:23" +%s    # 换算成秒计算(1970年至今的秒数)
    date -d "@1363867952" +%Y-%m-%d-%T   # 将时间戳换算成日期
    date -d "1970-01-01 UTC 1363867952 seconds" +%Y-%m-%d-%T  # 将时间戳换算成日期
    date -d "`awk -F. '{print $1}' /proc/uptime` second ago" +"%Y-%m-%d %H:%M:%S"    # 格式化系统启动时间(多少秒前)

}
