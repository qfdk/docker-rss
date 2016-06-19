# Docker-rss-mid

[![Author](https://img.shields.io/badge/author-@qfdk-blue.svg?style=flat)](http://qfdk.me/) 
[![Build Status](https://travis-ci.org/qfdk/docker-rss-tomcat.svg?branch=master)](https://travis-ci.org/qfdk/docker-rss-tomcat)
[![Platform](https://img.shields.io/badge/platform-Linux,%20BSD,%20OS%20X,%20Windows-green.svg?style=flat)](https://qfdk.me) 
[![License](https://img.shields.io/badge/license-New%20BSD-yellow.svg?style=flat)](LICENSE)

Deux images docker marchés :)


``` bash

# Middletier
docker run --rm --link tomcat:localhost --name middletier1  --hostname middletier1  qfdk/docker-rss:mid
docker run --rm --link tomcat:localhost --name middletier2  --hostname middletier2  qfdk/docker-rss:mid

```