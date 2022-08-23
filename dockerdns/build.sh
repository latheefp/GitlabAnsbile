VER=2.8
#docker build -t latheef/bind9:$VER -f Dockerfile.$VER
docker build -t latheef/bind9:$VER . 
docker stop dns-server; docker rm dns-server
docker run  -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53  latheef/bind9:$VER
docker exec -it dns-server sh
