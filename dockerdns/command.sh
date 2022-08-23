#https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899
docker network create --subnet=172.20.0.0/16 dns-net
#docker build -t bind9 .
#docker build -t bind9:2 .
docker run -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 bind9
docker run -d --rm --name=dns-server --net=dns-net --ip=172.20.0.2 -p 53:53  bind9:2.0

sudo docker exec -d dns-server /etc/init.d/bind9 start

docker run -d --rm --name=host1 --net=dns-net --ip=172.20.0.3 --dns=172.20.0.2 ubuntu:bionic /bin/bash -c "while :; do sleep 10; done"
docker run -d --rm --name=host2 --net=dns-net --ip=172.20.0.4 --dns=172.20.0.2 ubuntu:bionic /bin/bash -c "while :; do sleep 10; done"
