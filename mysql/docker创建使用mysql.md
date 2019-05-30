### 1. 指令
```
1. docker pull mysql:5.7.21
2. mkdir -p data logs conf
3. docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.21     ----设置挂载点以及密码
4. docker exec -it mysql bash                  ----查看mysql的
5. mysql -uroot -p123456
6. use mysql
7. GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'zjc' WITH GRANT OPTION;
8. FLUSH PRIVILEGES;
9. exit
10. mysql -h 127.0.0.1 -uroot -p123456   	----登陆
```













