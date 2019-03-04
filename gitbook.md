# 使用gitbook搭建在线预览编辑文件环境
**目录**

* [1.vagrant安装配置](#1)
* [2.pyenv安装配置](#2)
* [3.mysql安装](#3)

### 1. 安装(升级)npm
```
apt install npm

npm install npm@latest -g
```
### 2.npm安装gitbook命令行工具
```
npm install gitbook-cli -g

gitbook -v
如果出现/usr/bin/node: ‘node’: No such file or directory
sudo ln -s /usr/bin/nodejs /usr/bin/node

gitbook init
```
### 3.gitbook常用命令
```
生成静态网页
gitbook build 

本地服务器运行
gitbook serve
```