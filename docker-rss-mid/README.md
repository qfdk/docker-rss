## docker-rss-mid

Deux images docker marchés :)


``` bash

# Middletier
docker run --rm --link tomcat:localhost --name middletier1  --hostname middletier1  qfdk/docker-rss:mid
docker run --rm --link tomcat:localhost --name middletier2  --hostname middletier2  qfdk/docker-rss:mid

```