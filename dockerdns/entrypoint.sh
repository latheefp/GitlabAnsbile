#!/bin/bash
CONFPATH=/etc/bind/conf
SRCPATH=/etc/bind/default
echo Domain is  $DOMAIN
RZONE=$(host $(ifconfig eth0|grep inet|awk {'print $2'})|awk {'print $1'}|cut -d "." -f2-6) 
echo nameserver 127.0.0.1 >/etc/resolv.conf
#echo options ndots:0 >> /etc/resolv.conf
echo "search $DOMAIN" >>/etc/resolv.conf


if [ ! -d $CONFPATH ]; then
 echo "$CONFPATH  not exists, exiting"
 exit 1
fi

echo checking $CONFPATH/$DOMAIN
if [ ! -f $CONFPATH/$DOMAIN ]
   then
    cp $SRCPATH/db.def $CONFPATH/$DOMAIN
fi

echo checking $CONFPATH/named.conf.local 
if [ ! -f $CONFPATH/named.conf.local ]
then
   cp $SRCPATH/named.conf.local $CONFPATH/
fi

echo checking $CONFPATH/$RZONE

if [ ! -f $CONFPATH/$RZONE ]
then
   cp $SRCPATH/rev.def $CONFPATH/$RZONE
fi

echo checking $CONFPATH/named.conf.options

if [ ! -f $CONFPATH/named.conf.options ]
then
   cp $SRCPATH/named.conf.options $CONFPATH/
fi

sed -i -e  "s/local.lan/$DOMAIN/g" $CONFPATH/named.conf.local 
sed -i -e "s/rev.local/$RZONE/g" $CONFPATH/named.conf.local 
sed -i -e "s/local.lan/$DOMAIN/g" $CONFPATH/$DOMAIN
sed -i -e "s/local.lan/$DOMAIN/g" $CONFPATH/$RZONE


echo include \"$CONFPATH/named.conf.options\"\; >/etc/bind/named.conf
echo include \"$CONFPATH/named.conf.local\"\; >>/etc/bind/named.conf
echo include \"/etc/bind/named.conf.default-zones\"\; >>/etc/bind/named.conf

service bind9 start ; while true; do sleep 100; done;
