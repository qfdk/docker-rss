#! /bin/bash

## A modifier(mac par default)
IP=192.168.99.100

## A modifier(linux par default)
#IP=172.17.0.1

Tomcat=0
Middletier=0
Edge=0


function stop()
{
	echo -e "\033[32m[info] Try to stop .... \033[0m" 
	docker stop tomcat middletier1 middletier2 edge1 edge2   ||true
}

function remove()
{
	echo -e "\033[32m[info] Try to delete ....\033[0m" 
	docker rm -f tomcat middletier1 middletier2 edge1 edge2   ||true
}

function main(){

	echo "[info] Loading Tomcat ..."
	# docker run -d -p 8888:80 -v `pwd`:/usr/local/tomcat/webapps/ --name tomcat --privileged=true qfdk/tomcat
	docker run -d -p 8888:80 --name tomcat --privileged=true qfdk/docker-rss:eureka

	echo "[info] Loading Middletier"
	docker run -d --link tomcat:localhost --name middletier1  --hostname middletier1  qfdk/docker-rss:mid
	docker run -d -p 9191:9191 -p 9192:9192 --link tomcat:localhost --name middletier2  --hostname middletier2  qfdk/docker-rss:mid
    # docker run -d -p 9191:9191 -p 9192:9192  --link tomcat:localhost --name middletier3  --hostname middletier3  qfdk/docker-rss:mid
	echo "[info] Loading Edge"
	docker run -d -p 3000:9090 --name edge1 --link tomcat:localhost --link middletier1:middletier1 --link middletier2:middletier2 qfdk/docker-rss:edge
	docker run -d -p 3001:9090 --name edge2 --link tomcat:localhost --link middletier1:middletier1 --link middletier2:middletier2 qfdk/docker-rss:edge
    # docker run -d -p 3002:9090 --name edge3 --link tomcat:localhost --link middletier1:middletier1 --link middletier2:middletier2 --link middletier3:middletier3 qfdk/docker-rss:edge

    ## test connexion tomcat ##
	while [[ $Tomcat -eq "0" ]]; do
		nc -w 2 $IP 8888 && Tomcat=1;
	done

	echo -e "\033[32m[+] Tomcat Done. \033[0m" 

	 ## test connexion mid ##
	while [[ $Middletier -eq "0" ]]; do
		nc -w 2 $IP 9191 && Middletier=1;
	done

	echo -e "\033[32m[+] Middletier Done. \033[0m" 

	## test connexion edge ##
	while [[ $Edge -eq "0" ]]; do
		nc -w 2 $IP 3001 && Edge=1;
	done

	echo -e "\033[32m[+] Edge Done. \033[0m" 


	echo "Done! ==> http://ip:3000/jsp/rss.jsp"

}

## main
for arg in "$*"
do
	if [ "$arg" = "stop" ]; then
		stop||exit;
	fi
	if [ "$arg" = "remove" ]; then      
		remove||exit;
	fi
done

if [[ $# -eq "0" ]]; then      
	remove&&main
fi
