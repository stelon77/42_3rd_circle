FROM alpine:latest

RUN apk update && apk add nginx wget php7-common php7-iconv php7-json php7-gd \
        php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
         php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
        php7-ctype php7-dom php7 php7-fpm php7-opcache php7-zlib php7-session \
		openrc openssl openssh

#directory creation of our site
RUN mkdir -p /usr/share/webservice/phpmyadmin/
#phpmyadmin installation and setup
RUN wget -P /tmp https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz \
&& tar -xzvf /tmp/phpMyAdmin-4.9.5-all-languages.tar.gz --strip-components=1 -C /usr/share/webservice/phpmyadmin \
&& rm /tmp/phpMyAdmin-4.9.5-all-languages.tar.gz

# needed to launch nginx
RUN	mkdir -p var/run/nginx

#create nginx config file
COPY	index_nginx.html /usr/share/webservice/
RUN	rm /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/nginx.conf

# copy config file phpmyadmin
COPY config.inc.php /usr/share/webservice/phpmyadmin/config.inc.php

# launch php and nginx
COPY    begin.sh .
RUN	chmod +x begin.sh
CMD  ["sh", "./begin.sh" ]
