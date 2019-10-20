#!/bin/bash
# todo 转发所有本机外发的 ip 数据包
iptables -t nat -N V2RAY_LOCAL                         
iptables -t nat -A OUTPUT -p tcp -j V2RAY_LOCAL       
iptables -t nat -A OUTPUT -p udp -j V2RAY_LOCAL      
iptables -t nat -A V2RAY_LOCAL -m set --match-set vps4 dst -j RETURN      # 如果目标 ip 地址在名为 vps4 的 ipset 中，那么放行
iptables -t nat -A V2RAY_LOCAL -d 192.168.0.0/16 -j RETURN                # 如果目标 ip 地址是私有地址，那么放行
iptables -t nat -A V2RAY_LOCAL -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY_LOCAL -p tcp -j REDIRECT --to-ports 12345  
iptables -t nat -A V2RAY_LOCAL -p udp --dport 53 -j REDIRECT --to-ports 12345 
