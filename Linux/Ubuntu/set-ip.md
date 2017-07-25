# Ubuntu set ip address

1. `sudo vi /etc/network/interfaces`

2. ```
   auto eth0:1
   iface eth0:1 inet static
     address 192.168.1.24
     netmask 255.255.255.0
     network 192.168.1.1
     broadcast 192.168.1.255
     gateway 192.168.1.1
   ```
3. `ifdown <interface> && ifup <interface>`
