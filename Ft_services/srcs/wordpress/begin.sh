/usr/sbin/php-fpm7

cd /usr/share/webservice/;
mkdir -p wordpress;
cd wordpress;

if ! $(wp core is-installed); then
    wp core download;

    while true; do
       if wp config create --dbname=42_ft_services --dbuser=moa --dbpass=moa --dbhost=mysql; then
            break;
        fi;

        sleep 5;
    done;

    #wp language core activate en_US
    wp core install --url=http://172.17.0.2:5050 --title=ft_services --admin_user=user42 --admin_password=user42 --admin_email=lcoiffie@student.42.fr;


    wp user create user1 user1@example.com --role=author ;
    wp user create user2 user2@example.com --role=contributor;
    wp user create user3 use31@example.com;
fi

nginx -g "daemon off;"