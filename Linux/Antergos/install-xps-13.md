# Install Antergos Linux at xps13

> 其實安裝不是什麼問題，只是有些小問題要修復

* 中文字體醜到不能接受啊！  
  解法：
  
  1. 用英文（推薦）
  
  2. 換字體，參考：
  
    * <http://blog.jyny.tw/2015/01/antergos.html>
  
    * <http://pre.tir.tw/008/blog/output/antergos-arch-linux-yan-sheng-ban-ben.html>
     
* 觸控板不能使用：  
  更換觸控板驅動程式：  
  ```bash
  sudo pacman -S xf86-input-libinput
  sudo pacman -Rs xf86-input-synaptics
  sudo mv /etc/X11/xorg.conf.d/50-synapitcs.conf /etc/X11/xorg.conf.d/50-synapitcs.conf.bak
  ```
  然後重開機
  
* visudo 開起來是 nano （我用不習慣）：`sudo EDITOR=vim visudo`

* 因為懶所以個人電腦的 sudo 會希望不要打密碼，如果 visudo 中的設定已經好了，但依然無法生效的話，`/etc/sudoers.d/` 資料夾裡面的檔案也要設定一下


* 其他的有問題請參考：
  
  * [https://wiki.archlinux.org/index.php/Dell_XPS_13_(9350)](https://wiki.archlinux.org/index.php/Dell_XPS_13_(9350))
  * <https://github.com/arthurc0102/Note/blob/master/Linux/Arch/install-xps-13.md>
