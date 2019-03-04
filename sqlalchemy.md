**目录**

* [1.flask migrate](#1)
* [2.pyenv安装配置](#2)
* [3.mysql安装](#3)

### 1. migrate更新表结构
```
python manage.py db init
python manage.py db migrate
python manage.py db upgrade
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




