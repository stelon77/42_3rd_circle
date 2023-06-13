# !/bin/sh

# launch ssh deamon
/usr/sbin/sshd &

#demarrer nginx en arriere plan
nginx -g "daemon off;"
