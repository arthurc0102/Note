# install vmware tool on centos7


### install depend package
* `yum -y install perl gcc make kernel-headers kernel-devel`
* install `ifconfig`: `yum install -y net-tools`


### mount vmware cd
1. mount cd to /mnt: `mount /dev/cdrom /mnt`
2. cp to home: `cp /mnt/VMwareTools-4.0.0-164009.tar.gz ~/`
3. change to home: `cd`
4. unzip: `tar -xvf VMwareTools-4.0.0-164009.tar.gz`
5. to vm tool folder: `cd vmware-tools-distrib`
6. install: `./vmware-install.pl`
