docker pull mysql:5.7.21
mkdir -p /tmp/test
cd /tmp/test
mkdir -p data logs conf
docker run -p 3306:3306 --name mysql -v $PWD/conf:/etc/mysql/conf.d -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7.21
