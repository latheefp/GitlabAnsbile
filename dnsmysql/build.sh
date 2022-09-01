VER=1.0
#docker build -t latheef/bind9:$VER -f Dockerfile.$VER
docker build -t latheefp/bindmysql:$VER . 
docker stop bindmysql; docker rm bindmysql
docker run  -d --rm --name=bindmysql --net=dns-net --ip=172.20.0.2 -p 53:53/udp  -p 53:53/tcp latheefp/bindmysql:$VER
docker exec -it bindmysql  sh
#docker push latheefp/bindmysql:$VER
