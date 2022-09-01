VER=2.9
#docker build -t latheef/bind9:$VER -f Dockerfile.$VER
rm etc/bind/*
docker stop dns-server
docker rm  image latheefp/bind9:2.9
docker build -t latheefp/bind9:$VER . 
#docker stop dns-server; docker rm dns-server
#docker run  -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53/udp etc/bind:/etc/named/conf -p 53:53/tcp latheefp/bind9:$VER
docker run  -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53/udp --volume=`pwd`/etc/bind:/etc/bind/conf -p 53:53/tcp latheefp/bind9:2.9 
#docker run  -d --rm -ti --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53/udp --volume=`pwd`/etc/bind:/etc/bind/conf -p 53:53/tcp latheefp/bind9:2.9
#docker run  -d  -ti --name=dns-server --restart on-failure --net=dns-net --ip=172.20.0.2 -p 53:53/udp --volume=`pwd`/etc/bind:/etc/bind/conf -p 53:53/tcp latheefp/bind9:2.9
docker exec -it dns-server sh
#docker push latheefp/bind9:$VER
