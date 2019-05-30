docker pull redis
mkdir /home/docker/redis/{conf,data} -p
cd /home/docker/redis && wget https://raw.githubusercontent.com/antirez/redis/4.0/redis.conf -O conf/redis.conf
sed -i 's/logfile ""/logfile "access.log"/' conf/redis.conf
sed -i 's/# requirepass foobared/requirepass 123456/' conf/redis.conf
sed -i 's/appendonly no/appendonly yes/' conf/redis.conf
docker run -p 6379:6379 -v $PWD/data:/data:rw -v $PWD/conf/redis.conf:/etc/redis/redis.conf:ro --privileged=true --name myredis -d redis redis-server /etc/redis/redis.conf