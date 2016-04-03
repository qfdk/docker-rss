## RSS-mid-edge

Deux images docker marchés :)

Tags Docker:

- mid
- edge

## Get start


``` bash

# Download tomcat 
docker run --rm -p 80:80 --name tomcat --privileged=true qfdk/tomcat

# Middletier
docker run --rm --link tomcat:localhost --name middletier1  --hostname middletier1  qfdk/docker-rss:mid
docker run --rm --link tomcat:localhost --name middletier2  --hostname middletier2  qfdk/docker-rss:mid

# edge
docker run --rm -P -p 3000:9090 --link tomcat:localhost --link middletier1:middletier1 qfdk/docker-rss:edge
docker run --rm -P -p 3001:9090 --link tomcat:localhost --link middletier2:middletier2 qfdk/docker-rss:edge


```

## Balancer


Il faut utiliser `nginx` pour balancer.

```
	upstream sample {  
	  server 127.0.0.1:3000;  
	  server 127.0.0.1:3001;  
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

## Todo :X

- css
