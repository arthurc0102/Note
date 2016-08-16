# 安裝 archlinux

> 安裝電腦：dell xps 13 9350 i7-6560u


## 步驟

### 製作安裝 USB

1. 下載 [ISO 檔](https://www.archlinux.org/download/)

2. dd 指令：`# dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx && sync`

3. 用 USB 開機


### 設定網路

* 有線的：`# dhcpcd`

* 無線的：`# wifi-menu`


### 分割磁碟


### 格式化硬碟


### 設定 mirrorlist

### 安裝

## 參考連結

* [Arch Wiki - Dell XPS 13 (2016)](https://goo.gl/hwkjoP)

* [Installing Linux on the Dell XPS 13 (2016) 9350 Skylake revision](https://www.linuxserver.io/index.php/2016/02/04/installing-linux-on-the-dell-xps-13-2016-9350/)

* [Github - lambda](https://github.com/lambdaTW/learn/blob/master/linux/arch/V3_371)

* [USB flash installation media (正體中文)](https://goo.gl/V3M80e)
