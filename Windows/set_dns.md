# 設定 dns

> 利用指令設定 dns server


## 步驟

1. 顯示網路介面卡： `netsh interface show interface`

2. 設定 dns server ： `netsh interface ip add dns name="<介面卡名稱>" addr=<dns server ip> index=<順序>`


## 舉例

* 指令： `netsh interface ip add dns name="乙太網路" addr=8.8.8.8 index=1`


## 參考網站

* [How can I set my DNS settings using the command-prompt or PS?](http://superuser.com/questions/204046/how-can-i-set-my-dns-settings-using-the-command-prompt-or-ps)
