iptables -F
iptables -X
iptables -Z
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT 
iptables -A INPUT -s 172.19.155.0/24 -j ACCEPT
iptables -A INPUT –s 172.18.255.0/24 –j ACCEPT
iptables -A INPUT -t tcp --dport 80 -j ACCEPT
iptables-save > /etc/sysconfig/iptables
