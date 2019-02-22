#! /bin/sh
sudo apt-get update
apt-get install mariadb-server python-pymysql << EOF
y
EOF
mysql_secure_installation << EOF
gilgamesh
y
gilgamesh
gilgamesh
y
y
y
y
EOF
