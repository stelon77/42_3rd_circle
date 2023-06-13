USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS `42_ft_services`  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
CREATE USER 'moa'@'%' IDENTIFIED BY 'moa' ;
GRANT ALL PRIVILEGES ON 42_ft_services.* TO 'moa'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
