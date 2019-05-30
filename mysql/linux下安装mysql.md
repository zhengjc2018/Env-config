**目录**

* [1.centos下安装](#1)
* [2.ubuntu下安装](#1)

### 1. centos下安装
1.1. 下载并安装mysql 源安装包
```
1. curl -LO http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
2. sudo yum localinstall -y mysql57-community-release-el7-11.noarch.rpm
3. sudo yum repolist enabled | grep "mysql.*-community.*"
```
1.2. 安装
```
1. sudo yum install -y mysql-community-server
```
1.3. 启动服务
```
1. sudo systemctl enable mysqld          ---- 安装服务
2. sudo systemctl start mysqld           ---- 启动服务
3. sudo systemctl status mysqld          ---- 查看服务状态
```
1.4. 修改root默认密码
```
1. grep 'temporary password' /var/log/mysqld.log
2. mysql -u root -p
3. mysql> ALTER USER 'root'@'%' IDENTIFIED BY '123456';
```
### 2. ubuntu下安装
2.1.  安装mysql
```
sudo apt-get update
apt-get install mysql-server
```
2.2. mariadb安全设置
```
mysql_secure_installation
```
2.3. 其他设置
```
mysql -uroot -p
use mysql
grant all privileges on *.* to root@'%' identified by '123';
FLUSH PRIVILEGES;

mariadb服务启动与停止
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
```