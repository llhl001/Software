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



# todo 转发其他主机的 ip 数据包
iptables -t mangle -N V2RAY_TPROXY
iptables -t mangle -A PREROUTING -j V2RAY_TPROXY
iptables -t mangle -A V2RAY_TPROXY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x00000080/0x00000080
iptables -t mangle -A V2RAY_TPROXY -p tcp -j TPROXY --on-port 12345 --tproxy-mark 0x00000080/0x00000080



# todo 使用路由配置，将有标记的 ip 数据包，通过本地回环网卡发送回本地
ip rule add pref 100 fwmark 0x00000080/0x00000080 table 100      # 添加路由规则，优先级 100，将有标记的 ip 数据包，使用 100 号路由表进行路由
ip route add table 100 local 0.0.0.0/0 dev lo 







