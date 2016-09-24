# 網路相關設定


### 設定
* ip
  * 設定檔案：`/etc/sysconfig/network-scripts/ifcfg-[網卡名稱]`
  * 新增：`IPADDR=[ip address]`

* gateway
  * 設定檔案：`/etc/sysconfig/network-scripts/ifcfg-[網卡名稱]`
  * 新增：`GATEWAY=[gateway]`

* netmask
  * 設定檔案：`/etc/sysconfig/network-scripts/ifcfg-[網卡名稱]`
  * 新增：`NETMASK=[netmask]`

* nameserver (dns server)
  * 設定檔案：`/etc/resolv.conf`
  * 新增：`nameserver [dns ip]`
    * **不需要等號**
    * **不需要等號**
    * **不需要等號**


### 檔案內容
* 檔案：`/etc/sysconfig/network-scripts/ifcfg-[網卡名稱]`
* 參數意義

  ```
  DEVICE=eth0：這個裝置的名稱  
  BOOTPROTO=static：使用我們給的網路名稱 (若為浮動 IP 則為 dhcp)  
  BROADCAST=192.168.1.255：這是節點的網域  
  IPADDR=192.168.1.2：這是這塊網路卡的位址  
  NETMASL=255.255.255.0：子遮罩網路  
  NETWORK=192.168.1.0：工作的網域  
  ONBOOT=yes：開機自動開啟網路卡
  ```

### 錯誤排除
  1. [connect: Network is unreachable](http://linux.vbird.org/linux_server/redhat6.1/linux_21internet.php)


### 參考網站
