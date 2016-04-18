## RSS-eurake-mid-edge

[![Author](https://img.shields.io/badge/author-@qfdk-blue.svg?style=flat)](http://qfdk.me/) 
[![Platform](https://img.shields.io/badge/platform-Linux,%20BSD,%20OS%20X,%20Windows-green.svg?style=flat)](https://github.com/ideawu/ssdb) 
[![License](https://img.shields.io/badge/license-New%20BSD-yellow.svg?style=flat)](LICENSE)


Trois images docker marchés :)


## Tags Docker:

- docker pull qfdk/docker-rss:eureka
- docker pull qfdk/docker-rss:mid
- docker pull qfdk/docker-rss:edge

## Dir
```
	.
	├── README.md
	├── docker-rss-edge
	│   ├── Dockerfile
	│   └── README.md
	├── docker-rss-eureka
	│   ├── Dockerfile
	│   ├── README.md
	│   ├── eureka.war
	│   ├── server.xml
	│   └── tomcat-users.xml
	├── docker-rss-mid
	│   ├── Dockerfile
	│   └── README.md
	├── monkey.sh
	└── myInstances.sh
	
	3 directories, 12 files
```

## Plus simple (automatic)
```bash
git clone https://github.com/qfdk/docker-rss.git
cd docker-rss
## lancer stop remove 
## modifier IP dans la script!!!
./myInstances.sh [stop|remove]

```

## Get start (copier/coller)

``` bash
echo "[info] Loading Eureka"
docker run -d -p 8888:80 --name tomcat --privileged=true qfdk/docker-rss:eureka

echo "[info] Loading Middletier"
docker run -d --link tomcat:localhost --name middletier1  --hostname middletier1  qfdk/docker-rss:mid
docker run -d -p 9191:9191 -p 9192:9192 --link tomcat:localhost --name middletier2  --hostname middletier2  qfdk/docker-rss:mid

echo "[info] Loading Edge"
docker run -d -p 3000:9090 --name edge1 --link tomcat:localhost --link middletier1:middletier1 --link middletier2:middletier2 qfdk/docker-rss:edge
docker run -d -p 3001:9090 --name edge2 --link tomcat:localhost --link middletier1:middletier1 --link middletier2:middletier2 qfdk/docker-rss:edge
```

## OR build your own images
``` bash
## Build your images
cd docker-rss-eureka
docker build -t qfdk/eureka .

cd docker-rss-mid 
docker build -t qfdk/mid .

cd docker-rss-edge
docker build -t qfdk/edge .

```

## Load Balancer avec NGINX

Quelleque commande utile.

- Ubuntu

```bash
sudo apt-get update&&apt-get install nginx
sudo vim /etc/nginx/sites_available/default
```
- Mac OS 

```bash
brew install nginx
vim /usr/local/etc/nginx/nginx.conf
```

### Fichier nginx.conf

``` shell
	upstream sample {  
	  server 127.0.0.1:3000;  
	  server 127.0.0.1:3001;  
	  server 127.0.0.1:3002;
	  keepalive 64;  
	}  


	server {  
	  listen 80;  
	  server_name 127.0.0.1;   
	  location / {  
	    proxy_redirect off;  
	    proxy_set_header X-Real-IP $remote_addr;  
	    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  
	    proxy_set_header X-Forwarded-Proto $scheme;  
	    proxy_set_header Host $http_host;  
	    proxy_set_header X-NginX-Proxy true;  
	    proxy_set_header Connection "";  
	    proxy_http_version 1.1;  
	    proxy_pass http://sample;  
	    }  
	}  
	
```


## License New BSD


![img-source-from-https://github.com/docker/dockercraft](https://github.com/docker/dockercraft/raw/master/docs/img/contribute.png?raw=true)
