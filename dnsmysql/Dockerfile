FROM ubuntu:bionic
CMD [ "export RUNLEVEL=1 " ]

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc \
  net-tools \
  dnsutils \
  mysql-client \
  vim \
  pdns-server  
 # pdns-backend-mysql

# Enable IPv4
RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9
#Enviroments
ENV DOMAIN=riyadh.lan

# Copy configuration files
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.riyadh.lan /etc/bind/zones/
COPY rev.0.20.172.in-addr.arpa /etc/bind/zones/
ADD domain.sh /etc/bind/domain.sh
#COPY domain.sh /etc/bind/domain.sh


# Run eternal loop
#CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]
#CMD ["/bin/bash", "-c", /etc/init.d/bind9 start;  "while :; do sleep 10; done"]
CMD [ " systemctl disable systemd-resolved " ]
CMD [ " systemctl stop systemd-resolved " ]


# Start bind9 service
EXPOSE 53
#CMD ["/etc/init.d/bind9 start"]
#ENTRYPOINT  ["/bin/bash /etc/init.d/bind9 start"]
#ENTRYPOINT  service bind9 start && bash
CMD  [ "/etc/bind/domain.sh" ]
CMD  service bind9 start ; while true; do sleep 100; done;
