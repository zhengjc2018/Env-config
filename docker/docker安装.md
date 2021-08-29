**目录**

* [1.docker-compose安装配置(ubuntu)](#1)

* [2.设置repo](#2)

* [3.docker-ce安装配置](#3)

* [4.jenkins安装配置](#4)

####  原文链接

> <https://docs.docker.com/compose/install/#install-as-a-container>
>
> <https://docs.docker.com/install/linux/docker-ce/centos/>

### 1. Install Compose

1.1. download the current stable release of Docker Compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
1.1.1. 使用国内镜像下载
```
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
```

1.2. Apply executable permissions to the binary
```
sudo chmod +x /usr/local/bin/docker-compose
```
1.3. create a symbolic link
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
1.4. test
```
docker-compose --version
```

### 2. SET UP THE REPOSITORY

2.0. Update the apt package index
```
sudo apt-get update
```
2.1. Install packages to allow apt to use a repository over HTTPS
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
2.2. Add Docker’s official GPG key
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
2.3. searching for the last 8 characters of the fingerprint

```
sudo apt-key fingerprint 0EBFCD88
```
2.4. set up the stable repository
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
### 3. INSTALL DOCKER CE

3.1. Update the apt package index

```
sudo apt-get update
```
3.2. Install the latest version of Docker CE and containerd
```
sudo apt-get install docker-ce
```
3.2.1 E: Package 'docker-ce' has no installation candidate
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` test"
sudo apt update
sudo apt install docker-ce
```

3.3. test

```
sudo docker run hello-world
```

### 4. 安装jenkins

4.1. 启动jenkins服务
```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
4.2. 首次登陆获得key
```
cat /var/jenkins_home/secrets/initialAdminPassword
```

