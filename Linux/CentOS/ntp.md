# CentOS NTP client set


### Check date

指令：`date`


### Install and Set

* install: `yum install ntp`
* set ntp server: `ntpdate [ntp server]`
* ntp server:
  > tock.stdtime.gov.tw  
  > watch.stdtime.gov.tw  
  > time.stdtime.gov.tw  
  > clock.stdtime.gov.tw  
  > tick.stdtime.gov.tw  

* start ntp: `systemctl start ntpd`
* start ntp everytime: `systemctl enable ntpd`
