#!/bin/bash

read -p "Interfaccia: " netiface
echo "DEVICE=$netiface" >> /etc/sysconfig/network-scripts/ifcfg-$(echo $netiface)
echo "BOOTPROTO=none" >> /etc/sysconfig/network-$(echo $netiface)
echo "ONBOOT=yes" >> /etc/sysconfig/network-$(echo $netiface)
echo "PREFIX=24" >> /etc/sysconfig/network-$(echo $netiface)
read -p "Ip: " ip
echo "IPADDR=$ip" >> /etc/sysconfig/network-$(echo $netiface)
su -c "systemctl restart network"
