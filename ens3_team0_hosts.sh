nmcli connection add con-name ens3 ifname ens3 type ethernet connection.autoconnection yes ipv4.method manual ipv4.address 172.18.255.*/24 ipv4.gateway 172.18.255.254 ipv4.dns 172.16.200.254,168.95.1.1
nmcli connection add con-name team0 ifname team0 type team config ‘{“runner”:{“name”:”activebackup”}}’
nmcli connection modify team0 ipv4.method manual ipv4.address 172.19.155.254/24
nmcl	I connection add con-name ens7 ifname ens7 type team-slave master team0
nmcli connection add con-name ens8 ifname ens8 type team-slave master team0
nmcli connection up ens3 team0
hostnamectl set-hostname server155.example.dic
