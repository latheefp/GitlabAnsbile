#!/bin/bash
VER=2.9
rm etc/bind/*
docker stop dns-server
docker rm  image latheefp/bind9:$VER
docker build -t latheefp/bind9:$VER . 
docker run  -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53/udp --volume=`pwd`/etc/bind:/etc/bind/conf -p 53:53/tcp -e DOMAIN=egrand.in latheefp/bind9:2.9 
docker push latheefp/bind9:$VER
docker exec -it dns-server sh
