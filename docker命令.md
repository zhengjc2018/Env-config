**目录**

* [1.docker常用指令](#1)

### 1. 指令
```
docker run -it -p 80     		\ #指定端口号，将宿主机中32768-61000中的一个端口号来映射到容									器内的80端口
		   -d            		\ #指定后台运行
		   -w /tmp  	  		\ #指定工作目录
		   -v $PWD/data:/data:rw -v $PWD/conf/redis.conf:/etc/redis/redis.conf:ro \ 								#设置挂载点以及文件读写权限 
		   -e 'WEB_PORT:8080'   \ #设置临时环境变量
		   --net=app 			\ #设置网络
		   --restart=always|on-failure:1|no    \ #设置重启策略
		   --name 'xxxx' 		\ #设置容器名
		   --link redus:db      \ #使用redis容器并将其命名为db
		   -icc=false           \ #关闭互通，只能通过link来指定
		   ubuntu 				\ #镜像名
		   /bin/bash			\ #启动时加载shell
docker ps -a 查看所有镜像
docker inspect <CONTAINER ID> 查看镜像的详细配置信息
docker stop/restart/start/rm <CONTAINER ID>  停止/重启/启动/移除镜像
docker history
ip a show docker0         查看网络接口docker0的信息，每个docker容器都会在这个接口上面分配ip地址
docker network create xxx    创建本地网络
```

### 2. DockerFile中的指令
```
1. FROM ubuntu    ----选择一个基础镜像
2. MAINTAINER xxx "xxx@gmail"         ----添加联系信息
3. ENV REFRESHED_AT 2019-5-20         ----添加更新时间/设置环境变量
4. RUN apt-get -qq update         	  ----通过run来执行命令
5. CMD ["/bin/true", 'l']             ----执行指定运行的命令
6. ENTRYPOINT ['/bin/sbin/nginx', '-g', 'daemon off;']     ----类似CMD命令，可在指令中通过数组方式获得参数，或者run命令行中获得参数
7. WORKDIR /tmp                       ----在容器内部设置一个工作目录
8. USER oracle:oracle                 ----指定用户以及用户组
9. VOLUME ['/tmp/project']			  ----设置挂载点，和docker cp命令相关
10. ADD software.lic /opt/software.lic  ----将构建目录下的文件复制到镜像中(文件/目录权限为755， add会让之后的指令我无法使用缓存构建, 会自动解压归档文件，不会覆盖操作)
11. COPY conf.d/ /etc/apache2/   ----同add，但不会提取内容
12. LABEL version="1.0" location="New York"    ----设置标签信息,可用inspect查看
13. ARG build       ----用来定义可以再docker build运行时传递给构建运行的变量 
14. EXPOSE       ----公开端口
```

### 3. 创建镜像
```
1. touch DockerFile
2. docker build -t="zjc2019/test" .  (需要先stop掉对应的容器和镜像，否则会出现unable to 		prepare context: unable to evaluate symlinks in Dockerfile path问题)
3. docker login
4. docker push zjc2019/test
```

### 4. 创建本地registry
```
1.docker run -d -p 5000:5000 --restart=on-failure --name registry registry:2
2.docker pull ubuntu:16.04
3.docker tag ubuntu:16.04 localhost:5000/my-ubuntu
4.docker push localhost:5000/my-ubuntu

(删除)
1.docker image remove ubuntu:16.04
2.docker image remove localhost:5000/my-ubuntu
3.docker pull localhost:5000/my-ubuntu
4.docker stop registry && docker rm -v registry
```

### 5. 创建本地网络
```
1. docker network create app             ----创建桥接网
2. docker network inspect app            ----查看app网络配置信息
3. docker network ls 					 ----查看所有docker网络信息
4. docker network connect app db2        ----将已有容器连接到docker网络中
5. docker network disconnect app db2     ----从网络中断开一个容器
```

### 6. docker-compose启动一个web服务
```
1. docker build -t xxx .
2. docker-compose up (出现OSError时可以通过去掉app.run的debug)
```















