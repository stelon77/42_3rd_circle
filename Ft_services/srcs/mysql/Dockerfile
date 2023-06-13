FROM alpine

#install mariadb (mysql)
RUN apk update && apk add mariadb mariadb-client

# evite error bind on unix socket
RUN mkdir -p /run/mysqld;

# script that will create a database and user for mariadb
COPY create_db_and_user.sql /create_db_and_user.sql

# config file for mariadb-server
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY my.cnf /etc/my.cnf

#script to start mysql
COPY ./begin.sh .
RUN chmod 777 begin.sh

#start container
ENTRYPOINT [ "./begin.sh" ]
