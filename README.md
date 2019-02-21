### 利用virtualBox+vagrant 搭建本地Linux环境
1. 下载virtualbox(https://www.virtualbox.org)
```
按照默认安装，完成后打开虚拟机，左上角管理-全局设定-常规-默认虚拟电脑位置进行设置
```
2. 下载vagrant(https://www.vagrantup.com) 
```
查询需要的虚拟机模板 https://app.vagrantup.com/boxes/search
```
3. 添加模板
```
vagrant box list
vagrant box add ubuntu/trusty64  (ubuntu/trusty64为上一步查询出的模板名称)
```
4. 进入项目目录，并初始化虚拟环境
```
vagrant init ubuntu/trusty64 
```
5. 启动虚拟环境
```
vagrant up
```
6. ssh 登陆
```
vagrant ssh或者使用其他软件登陆，默认端口号2222，用户名/密码为vagrant/vagrant
```
7. 常用命令
```
vagrant reload 重新加载虚拟机
vagrant halt 关闭虚拟机
vagrant destroy 删除虚拟机
```

### 利用pyenv进行python版本管理
1. 安装git
```
sudo apt-get update
sudo apt install git
```

2. 安装 pyenv
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

3. 安装virtualenv
```
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
source ~/.bash_profile

```

4. 安装相关编译所需的依赖包
```
 sudo apt install gcc make zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libreadline6-dev libsqlite3-dev python-tk python3-tk tk-dev
```

5. 查看所有可装的python版本并安装指定版本
```
pyenv install --list 
pyenv install 3.6.5 
```

6. 创建虚拟环境
```
pyenv virtualenv 3.6.5 project-01
cd /vagrant/project-01
pyenv local project-01
```

7. pyenv常用操作
```
pyenv versions        -- 系统当前部署的 python 环境
pyenv uninstall xxx   -- 删除 python 版本或 python 虚拟环境
pyenv activate xxx    -- 手动激活 python 虚拟环境
pyenv deactivate xxx  -- 手动去激活 python 虚拟环境
```

8. 快速安装指令
```
wget --no-check-certificate https://github.com/zhengjc2018/python/tree/master/pyenv_config/run.sh && chmod +x run.sh && ./run.sh

如果出现No command 'pyenv' found, 手动执行 source ~/.bash_profile
```