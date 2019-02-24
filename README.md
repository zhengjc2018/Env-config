**目录**

* [1.vagrant安装配置](#1)
* [2.pyenv安装配置](#2)
* [3.mysql安装](#3)

### 1. 利用virtualBox+vagrant 搭建本地Linux环境

1.1. 下载[virtualbox](https://www.virtualbox.org)
```
按照默认安装，完成后打开虚拟机，左上角管理-全局设定-常规-默认虚拟电脑位置进行设置
```
1.2. 下载[vagrant](https://www.vagrantup.com)

```
查询需要的虚拟机模板 https://app.vagrantup.com/boxes/search
```
1.3. 添加模板

```
vagrant box list
vagrant box add ubuntu/trusty64  (ubuntu/trusty64为上一步查询出的模板名称)
```
1.4. 进入项目目录，并初始化虚拟环境
```
vagrant init ubuntu/trusty64
```
1.5. 启动虚拟环境
```
vagrant up
```
1.6. ssh 登陆

```
vagrant ssh或者使用其他软件登陆，默认端口号2222，用户名/密码为vagrant/vagrant
(使用工具登陆需要设置  的 PasswordAuthentication为yes)
```
1.7. 常用命令
```
vagrant reload 重新加载虚拟机
vagrant halt 关闭虚拟机
vagrant destroy 删除虚拟机
```

### 2. 利用pyenv进行python版本管理

2.0. 设置dns
```
sudo vim /etc/resolvconf/resolv.conf.d/base

meserver 8.8.8.8
nameserver 8.8.4.4

sudo resolvconf -u  刷新配置文件
```

2.1. 安装git
```
sudo apt-get update
sudo apt install git
```

2.2. 安装 pyenv
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

2.3. 安装virtualenv
```
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> source ~/.bash_profile
source ~/.bash_profile

```

2.4. 安装相关编译所需的依赖包
```
 sudo apt install gcc make zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libreadline6-dev libsqlite3-dev python-tk python3-tk tk-dev
```

2.5. 查看所有可装的python版本并安装指定版本
```
pyenv install --list
pyenv install 3.6.5
```

2.6. 创建虚拟环境
```
pyenv virtualenv 3.6.5 project-01
cd /vagrant/project-01
pyenv local project-01
```

2.7. pyenv常用操作
```
pyenv versions        -- 系统当前部署的 python 环境
pyenv uninstall xxx   -- 删除 python 版本或 python 虚拟环境
pyenv activate xxx    -- 手动激活 python 虚拟环境
pyenv deactivate xxx  -- 手动去激活 python 虚拟环境
```

2.8. 快速安装指令
```
wget --no-check-certificate https://github.com/zhengjc2018/python/tree/master/pyenv_config/run.sh && chmod +x run.sh && ./run.sh

如果出现No command 'pyenv' found, 手动执行 source ~/.bash_profile
```
### 3. 安装mysql
3.1.  安装mysql
```
sudo apt-get update
apt-get install mysql-server
```
3.2. mariadb安全设置
```
mysql_secure_installation
```
3.3. 其他设置
```
mysql -uroot -p
use mysql
grant all privileges on *.* to root@'%' identified by '123';
FLUSH PRIVILEGES;

mariadb服务启动与停止
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
```




