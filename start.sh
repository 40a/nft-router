#!/bin/bash
modprobe nft_nat
modprobe nft_chain_nat_ipv4
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.core.netdev_max_backlog=250000
sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.rmem_default=16777216
sysctl -w net.core.optmem_max=16777216

echo "2" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "1" >  /proc/sys/net/ipv4/ip_forward

sh /media/sysdata/app/gate/netfilter/sys/iprules.sh
sh /media/sysdata/app/gate/netfilter/sys/nft.sh
