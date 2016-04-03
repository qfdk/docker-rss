## docker-rss-edge

Deux images docker marchés :)


``` bash

# edge
docker run --rm -P -p 3000:9090 --link tomcat:localhost --link middletier1:middletier1 qfdk/docker-rss:edge
docker run --rm -P -p 3001:9090 --link tomcat:localhost --link middletier2:middletier2 qfdk/docker-rss:edge

```
