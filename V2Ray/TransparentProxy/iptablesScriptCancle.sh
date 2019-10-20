#!/bin/bash
# todo 撤销上面的操作
iptables -t nat -D OUTPUT -p tcp -j V2RAY_LOCAL 
iptables -t nat -D OUTPUT -p udp -j V2RAY_LOCAL 
iptables -t nat -F V2RAY_LOCAL
iptables -t nat -X V2RAY_LOCAL



iptables -t mangle -D PREROUTING -j V2RAY_TPROXY
iptables -t mangle -F V2RAY_TPROXY
iptables -t mangle -X V2RAY_TPROXY
    
ip route del table 100 local 0.0.0.0/0 dev lo 
ip rule del pref 100 fwmark 0x00000080/0x00000080 table 100 
