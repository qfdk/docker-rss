# Docker-Tomcat [![Build Status](https://travis-ci.org/qfdk/docker-rss-tomcat.svg?branch=master)](https://travis-ci.org/qfdk/docker-rss-tomcat)



Tomcat use the port 80 and we can use the web-manager with user `qfdk`, password `qfdk`.

```shell
	root@3b4adb81fae8:/usr/local/tomcat# java -version
	openjdk version "1.8.0_72-internal"
	OpenJDK Runtime Environment (build 1.8.0_72-internal-b15)
	OpenJDK 64-Bit Server VM (build 25.72-b15, mixed mode)
```


## Usage

```bash
# clone project
git clone https://github.com/qfdk/docker-rss-tomcat && cd docker-rss-tomcat
# build image
docker build -t qfdk/tomcat .
# run your image
docker run -it --rm -p 80:80 qfdk/tomcat
```

Now, you have a Tomcat server uses port 80 and you can upload `*.war` with web-manager via *http://192.168.99.100* 





