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
iptables -A INPUT -s 172.18.255.0/24 –j ACCEPT
iptables -A INPUT -tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 172.18.255.155/24 -p tcp --dport 3131 -j ACCEPT
iptables -A INPUT -s 172.19.155.254/24 -p tcp --dport 3131 -j ACCEPT
iptables -A INPUT -s 10.10.10.0/24 -p tcp --dport 3131 -j REJECT
iptables -A INPUT -s 10.0.0.0/8 -p tcp --dport 3131 -j REJECT


iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z 
iptables -t nat -A POSTROUTING -s 172.19.155.1/24 -o ens3 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 4455 -j REDIRECT --to 22
iptables-save > /etc/sysconfig/iptables
