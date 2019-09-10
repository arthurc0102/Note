# 安裝 archlinux

> 安裝電腦：dell xps 13 9350 i7-6560u


## 步驟


### 製作安裝 USB

1. 下載 [ISO 檔](https://www.archlinux.org/download/)

2. dd 指令：`dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx && sync`

3. 用 USB 開機


### 設定網路

* 有線的：`dhcpcd`

* 無線的：`wifi-menu`


### 分割磁碟

* 看磁碟：`lsblk`

* gdisk
  * `p` 看目前現有分割
  * `n` 新增分割
  * `w` 寫入分割設定

* 選擇硬碟：`gdisk /dev/nvme0n1`
  1. nvme0n1p1
    * size : 512mb
    * type : ef00

  2. nvme0n1p2
    * szie : all
    * type : 8300


### 格式化硬碟

* efi 的空間要用 fat32 作格式化：`mkfs.vfat -F32 /dev/nvme0n1p1`

* 其他的空間要用 ext4 作格式化：`mkfs.ext4 /dev/nvme0n1p2`


### 設定 mirrorlist

* 檔案位置 `/etc/pacman.d/mirrorlist`

* 找到 `##Taiwan` 下面的網址就把他放到最上面修改後檔案的開頭

* 看起來就像這樣
  ```
  ...
  ## Generated on 2015-03-01
  ##

  Server = http://ftp.tku.edu.tw/Linux/ArchLinux/$repo/os/$arch

  ## Score: 0.3, France
  ...
  ```


### 安裝與設定

* 掛載：
  ```
  mount /dev/nvme0n1p2 /mnt
  mkdir /mnt/boot
  mount /dev/nvme0n1p1 /mnt/boot
  ```

* 安裝：`pacstrap /mnt base base-devel`

* 自動產生自動掛載檔：`genfstab -U -p /mnt >> /mnt/etc/fstab`

* 載入 EFI 模組：`modprobe efivarfs`

* 以 `/mnt` 當作 `/` ：`arch-chroot /mnt`

* 修改 root 的密碼：`passwd`

* 設定 hostname：`echo "xps13" >> /etc/hostname`

* 設定時間
  ```
  ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime
  hwclock --systohc --utc
  ```

* 設定語系

  * 修改檔案：`/etc/locale.gen`

  * 取消註解這些語系
  ```
  en_US.UTF-8 UTF-8
  zh_TW.UTF-8 UTF-8
  zh_TW BIG5
  ```

  * 套用設定：`locale-gen`

* 開機設定

  * 因為硬碟的關係 grub 不能用，我們改用 bootctl，如果要用 grub 設定如下（nvme0n1p2 要掛載在 /boot/efi）
    > $pacman -S grub-efi-x86_64 efibootmgr  
    > Grub Install: `grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug`  
    > 不確定是否適用於 nvme   

  * 安裝：`bootctl --path=/boot$esp install`

  * 設定：
    1. 檔案：`/boot/loader/loader.conf`
       ```
       default arch
       timeout 3
       editor 0
       ```

    2. 取得 UUID ：`blkid -s PARTUUID -o value /dev/nvme0n1p2`

    3. 檔案：`/boot/loader/entries/arch.conf`
       ```
       title   Arch Linux
       linux   /vmlinuz-linux
       initrd  /initramfs-linux.img
       options   root=PARTUUID=66e3f67d-f59a-4086-acdd-a6e248a3ee80 rw
       ```

    4. 套用：`bootctl update`

  * 設定硬體

    * 顯示卡、硬碟：

      * 檔案：`/etc/mkinitcpio.conf`
        ```
        ...
        MODULES="intel_agp i915 nvme"
        ...
        ```

      * 套用：`mkinitcpio -p linux`

    * 藍牙：

      * 下載：[9350_Network_Driver_XMJK7_WN32_12.0.1.720_A00.EXE](http://downloads.dell.com/FOLDER03272920M/1/9350_Network_Driver_XMJK7_WN32_12.0.1.720_A00.EXE)

      * 安裝 7-zip：`pacman -S p7zip`

      * 安裝 bluez-utils：`pacman -S bluez-utils`

        > for hex2hcd

      * 設定：
        ```
        7z x 9350_Network_Driver_XMJK7_WN32_12.0.1.720_A00.EXE
        cp Win32/BCM4350C5_003.006.007.0095.1703.hex ./
        hex2hcd BCM4350C5_003.006.007.0095.1703.hex
        mv BCM4350C5_003.006.007.0095.1703.hcd /lib/firmware/brcm/BCM-0a5c-6412.hcd
        ```

    * 安裝 wifi-menu 缺少的套件：`wifi-menu`

      > 依照提示補足缺少的套件

    * 離開 change root 模式：`exit`

    * 把掛載到 /mnt 的硬碟解除掛載：`umount -R /mnt`

    * 重開機：`reboot`

    * 拔掉隨身碟進入系統


### 系統設定

* 網路：同上

* 設定 pacman

  * 檔案：`etc/pacman.conf`

  * 取消註解
    ```
    ...
    [multilib]
    Include = /etc/pacman.d/mirrorlist
    ...
    ```

* 使用者：

  * 新增：`useradd -G wheel -s /bin/bash -m user`

  * 設定密碼：`passwd user`

  * 如果要讓這個使用者擁有 root 權限

    * 設定：`visudo`

    * 內容：
      ```
      ...
      ##
      ## User privilege specification
      ##
      root ALL=(ALL) ALL
      user ALL=(ALL) ALL  ## 新增這行
      ...
      ```

* 安裝顯卡驅動：`pacman -S xf86-video-intel`

* 安裝圖型化的元件：`pacman -S xorg-server xorg-server-utils xorg-xinit`

* 安裝觸控版驅動：`pacman -S xf86-input-libinput`

* 安裝字體：`pacman -S ttf-dejavu wqy-zenhei`

* 安裝 gnome：`pacman -S gnome`

  > 開機啟動 gdm：`systemctl enable gdm`

* 安裝 gnome 設定工具：`pacman -S gnome-tweak-tool`

* 安裝中文輸入法：`pacman -S ibus-chewing`

* 安裝 zsh：
  ```
  pacman -S zsh
  touch /home/user/.zshrc
  ```

* 安裝其他軟體：`pacman -S chromium vim rdesktop conky openssh guake firefox-i18n-zh-tw p7zip zip file-roller tree ipython git filezilla markdown libreoffice-fresh-zh-TW`

* gnome-terminal 如果不能使用：`localectl set-locale LANG="en_US.UTF-8"`

* 安裝讀寫 ntfs 與 exfat 的軟體：`pacman -S ntfs-3g exfat-utils`

* 安裝 fat32 格式化軟體：`pacman -S dosfstools`

## 參考連結

* [Arch Wiki - Dell XPS 13 (2016)](https://goo.gl/hwkjoP)

* [Installing Linux on the Dell XPS 13 (2016) 9350 Skylake revision](https://www.linuxserver.io/index.php/2016/02/04/installing-linux-on-the-dell-xps-13-2016-9350/)

* [Github - lambda](https://github.com/lambdaTW/learn/blob/master/linux/arch/V3_371)

* [USB flash installation media (正體中文)](https://goo.gl/V3M80e)
