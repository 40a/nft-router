#!/bin/sh
#/sbin/ip rule add from all table main pref 32766
#/sbin/ip rule add from all table default pref 32767

/sbin/ip route add default via {DEF_GW}
/sbin/ip rule add from 10.0.0.0/8 table {EXT_INTERFACE1_NAME} pref 30000

## add get from ip a

/sbin/ip route add {EXT_INTERFACE1_SUBNET} via {EXT_INTERFACE1_MAIN_IP} dev {EXT_INTERFACE1_NAME} table {EXT_INTERFACE1_NAME}
/sbin/ip route add default via {EXT_INTERFACE1_DEF_GW} dev {EXT_INTERFACE1_NAME} src {EXT_INTERFACE1_MAIN_IP} table {EXT_INTERFACE1_NAME}
/sbin/ip rule add from {EXT_INTERFACE1_SUBNET} table {EXT_INTERFACE1_NAME} pref 10000
/sbin/ip rule add fwmark {EXT_INTERFACE1_NAME_INTEGER} table {EXT_INTERFACE1_NAME} pref 10000

/sbin/ip route add 10.10.1.0/24 via 10.10.1.251 dev net11 table net11
/sbin/ip rule add to 10.10.1.0/24 table net11 pref 5000
/sbin/ip rule add fwmark 11 table net11 pref 5000

/sbin/ip route add 192.168.1.0/24 via 192.168.1.249 dev net10 table net10
/sbin/ip rule add to 192.168.1.0/24 table net10 pref 5000
/sbin/ip rule add fwmark 10 table net10 pref 5000

/sbin/ip route add 192.168.21.0/24 via 192.168.21.251 dev net21 table net21
/sbin/ip rule add to 192.168.21.0/24 table net21 pref 5000
/sbin/ip rule add fwmark 21 table net21 pref 5000
