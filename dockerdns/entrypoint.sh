#!/bin/bash
CONFPATH=/etc/bind/conf
SRCPATH=/etc/bind/default
#echo $DOMAIN
#RZONE=$(host $(ifconfig eth0|grep inet|awk {'print $2'})|awk {'print $1'}|cut -d "." -f2-6) 
#echo $RZONE
DOMAIN=riyadh.lan
RZONE=rev.0.20.172.in-addr.arp
echo "============== Afer copy ============="
ls -ltr /etc/bind/conf/

if [ ! -d $CONFPATH ]; then
 echo "$CONFPATH  not exists, exiting"
 exit 1
fi

if [ ! -f $CONFPATH/db.$DOMAIN ]
then
   cp $SRCPATH/db.def $CONFPATH/db.$DOMAIN
fi

if [ ! -f $CONFPATH/named.conf.local ]
then
   cp $SRCPATH/named.conf.local $CONFPATH/
fi

if [ ! -f $CONFPATH/db.$RZONE ]
then
   cp $SRCPATH/rev.def $CONFPATH/db.$RZONE
fi


if [ ! -f $CONFPATH/named.conf.options ]
then
   cp $SRCPATH/named.conf.options $CONFPATH/
fi

sed -i -e  "s/local.lan/$DOMAIN/g" $CONFPATH/named.conf.local 
sed -i -e "s/rev.local/$RZONE/g" $CONFPATH/named.conf.local 

echo include \"$CONFPATH/named.conf.options\"\; >/etc/bind/named.conf
echo include \"$CONFPATH/named.conf.local\"\; >>/etc/bind/named.conf
echo include \"$CONFPATH/named.conf.default-zones\"\; >>/etc/bind/named.conf

echo "============== Afer copy ============="
ls -ltr /etc/bind/conf/

service bind9 start ; while true; do sleep 100; done;
