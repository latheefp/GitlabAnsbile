FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  net-tools \
  dnsutils \
  vim  

# Enable IPv4
RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9
RUN mkdir /etc/bind/default
#Enviroments
ENV DOMAIN=local.lan
#ENV VLAN=

# Copy configuration files
#COPY named.conf.options /etc/bind/
#COPY named.conf.local /etc/bind/
#COPY db.riyadh.lan /etc/bind/zones/
#COPY rev.0.20.172.in-addr.arpa /etc/bind/zones/

COPY rev.def /etc/bind/default/
COPY named.conf.options /etc/bind/default/
COPY named.conf.local /etc/bind/default/
COPY db.def /etc/bind/default/

ADD entrypoint.sh /etc/bind/entrypoint.sh


# Run eternal loop
#CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]
#CMD ["/bin/bash", "-c", /etc/init.d/bind9 start;  "while :; do sleep 10; done"]


# Start bind9 service
EXPOSE 53
#CMD ["/etc/init.d/bind9 start"]
#ENTRYPOINT  ["/bin/bash /etc/init.d/bind9 start"]
#ENTRYPOINT  service bind9 start && bash
WORKDIR /etc/bind
RUN chmod +x /etc/bind/entrypoint.sh
CMD  /etc/bind/entrypoint.sh;
