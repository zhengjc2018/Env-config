### 1. 指令
```
1. apt install mysql-client-core-5.7
2. docker pull mysql:5.7.21
3. mkdir -p data logs conf
4. docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.21     ----设置挂载点以及密码
5. docker exec -it mysql bash                  ----查看mysql的
6. mysql -uroot -p123456
7. use mysql
8. GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'zjc' WITH GRANT OPTION;
9. FLUSH PRIVILEGES;
10. exit
11. mysql -h 127.0.0.1 -uroot -p123456   	----登陆
```













