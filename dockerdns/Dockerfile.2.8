FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc \
  net-tools \
  dnsutils \
  vim  

# Enable IPv4
RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9


# Copy configuration files
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.riyadh.lan /etc/bind/zones/

# Run eternal loop
CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]
#CMD ["/bin/bash", "-c", /etc/init.d/bind9 start;  "while :; do sleep 10; done"]


# Start bind9 service
EXPOSE 53
#CMD ["/etc/init.d/bind9 start"]
#ENTRYPOINT  ["/bin/bash /etc/init.d/bind9 start"]
#ENTRYPOINT  service bind9 start && bash
CMD  service bind9 start ; while true; do sleep 100; done;
