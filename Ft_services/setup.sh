#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcoiffie <lcoiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/01 20:01:28 by lcoiffie          #+#    #+#              #
#    Updated: 2020/07/01 20:01:29 by lcoiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

services=" nginx mysql wordpress phpmyadmin ftps influxdb telegraf grafana "

ft_create_service()
{
	for service in $services
	do
		echo "creating $service"
		docker build -t image-$service srcs/$service
		kubectl apply -f srcs/$service/deploy-$service.yaml
	done
}

# ******************************************************************************

#commandes potentiellement necessaires
#arreter nginx natif sur la vm
#sudo nginx -s stop
#remettre a zero les known_hosts pour le ssh de nginx
# ssh-keygen -f "/home/user42/.ssh/known_hosts" -R "172.17.0.2"

minikube delete

minikube start --vm-driver=docker
chown -R user42 $HOME/.kube $HOME/.minikube


#linking docker client to minikube environment
eval $(minikube docker-env)

CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
sed -i 's/172.17.0.2/'$CLUSTER_IP'/g' srcs/metallb/metallb-config.yaml
sed -i 's/172.17.0.2/'$CLUSTER_IP'/g' srcs/ftps/vsftpd.conf
sed -i 's/172.17.0.2/'$CLUSTER_IP'/g' srcs/nginx/nginx.conf
sed -i 's/172.17.0.2/'$CLUSTER_IP'/g' srcs/wordpress/begin.sh
sed -i 's/172.17.0.2/'$CLUSTER_IP'/g' srcs/telegraf/telegraf.conf


# minikube addons enable metrics-server
minikube addons enable logviewer
minikube addons enable dashboard
minikube addons enable metrics-server


#installation de metallb (load balancer)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#---
kubectl apply -f srcs/metallb/metallb-config.yaml


#creation fichier ~/.rnd
command dd if=/dev/urandom of=${HOME}/.rnd bs=256 count=1

#creation cle et certif ssl
 openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 -sha256 \
-keyout ./ssl.key \
-out ./ssl.crt \
-subj '/C=FR/ST=Seine et Marne/L=Fontainebleau/CN=42_ft_services/emailAddress=lcoiffie@student.42.fr' \
&& chmod 600 ./ssl.key \
&& chmod 600 ./ssl.crt

cp ssl.key ssl.crt ./srcs/ftps
cp ssl.key ssl.crt ./srcs/nginx/

#deploiement des services
ft_create_service

#suppression cles crees
rm ssl.key ssl.crt ./srcs/nginx/ssl.key ./srcs/nginx/ssl.crt \
	./srcs/ftps/ssl.key ./srcs/ftps/ssl.crt

#lancement minikube dashboard
minikube dashboard
