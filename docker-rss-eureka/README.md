# docker-rss-eureka 
[![Author](https://img.shields.io/badge/author-@qfdk-blue.svg?style=flat)](http://qfdk.me/) 
[![Build Status](https://travis-ci.org/qfdk/docker-rss-tomcat.svg?branch=master)](https://travis-ci.org/qfdk/docker-rss-tomcat)
[![Platform](https://img.shields.io/badge/platform-Linux,%20BSD,%20OS%20X,%20Windows-green.svg?style=flat)](https://qfdk.me) 
[![License](https://img.shields.io/badge/license-New%20BSD-yellow.svg?style=flat)](LICENSE)


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
git clone https://github.com/qfdk/docker-rss&& cd docker-rss-eureka
# build image
docker build -t qfdk/eureka .
# run your image
docker run -it --rm -p 80:80 qfdk/eureka
```

Now, you have a Tomcat server uses port 80 and you can upload `*.war` with web-manager via *http://192.168.99.100* 





