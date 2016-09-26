#!/bin/bash
modprobe nft_nat
modprobe nft_chain_nat_ipv4

sysctl -w net.ipv4.conf.all.arp_ignore=2
sysctl -w net.ipv4.ip_forward=1

echo 257536 > /sys/module/nf_conntrack/parameters/hashsize
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_established=54000
sysctl -w net.netfilter.nf_conntrack_max=524288

sysctl -w net.core.somaxconn=4096
sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.rmem_default=16777216
sysctl -w net.core.optmem_max=16777216
sysctl -w net.core.netdev_max_backlog=250000

sysctl -w net.ipv4.neigh.default.gc_thresh1=512
sysctl -w net.ipv4.neigh.default.gc_thresh2=1024
sysctl -w net.ipv4.neigh.default.gc_thresh3=2048
sysctl -w net.ipv4.tcp_max_tw_buckets=3276800
sysctl -w net.ipv4.tcp_fastopen=3
sysctl -w net.ipv4.tcp_keepalive_time=1800
sysctl -w net.ipv4.tcp_fin_timeout=25
#sysctl -w net.ipv4.ip_local_port_range=10000 65200

sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1

sh ../dev/iprules.sh
sh nft.sh
