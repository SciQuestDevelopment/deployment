FROM mysql:5.7.20
COPY ./database.sql /docker-entrypoint-initdb.d
COPY ./mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf 
