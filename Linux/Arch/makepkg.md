# makepkg


## 安裝 aur

指令：`makepkg -sir`


## 問題解法

1. 錯誤： 一份或多份 PGP 簽章無法通過核對！
  * gpg --recv-keys <key-id>
  * 參考網頁
    1. [ArchWiki](https://wiki.archlinux.org/index.php/Makepkg#Signature_checking)
