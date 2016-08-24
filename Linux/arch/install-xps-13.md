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

$gdisk /dev/sda

sda1
size:512mb
type:ef00

sda2
szie:all
type:8E00

### 格式化硬碟

$mkfs.vfat -F32 /dev/sda1
#efi的空間要用fat32作格式化

$mkfs.ext4 /dev/mapper/vgroup-root
$mkfs.ext4 /dev/mapper/vgroup-root
#用ext4格式化vgroup-root與vgroup-home,因為是ssd所以用discard參數


### 設定 mirrorlist

### 安裝

## 參考連結

* [Arch Wiki - Dell XPS 13 (2016)](https://goo.gl/hwkjoP)

* [Installing Linux on the Dell XPS 13 (2016) 9350 Skylake revision](https://www.linuxserver.io/index.php/2016/02/04/installing-linux-on-the-dell-xps-13-2016-9350/)

* [Github - lambda](https://github.com/lambdaTW/learn/blob/master/linux/arch/V3_371)

* [USB flash installation media (正體中文)](https://goo.gl/V3M80e)
