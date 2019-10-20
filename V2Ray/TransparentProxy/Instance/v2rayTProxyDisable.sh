#!/bin/bash
# todo 撤销上面的操作
iptables -t nat -D OUTPUT -p tcp -j V2RAY_LOCAL 
iptables -t nat -D OUTPUT -p udp -j V2RAY_LOCAL 
iptables -t nat -F V2RAY_LOCAL
iptables -t nat -X V2RAY_LOCAL
