# Cisco Router 設定 指令

* 一般模式：Router>
  * 進入超權限模式 → enable

* 超權限模式：Router#
  * 進入組態模式設定 → configure terminal
  * 顯示組態設定 → show running configure
  * 將 A 複製到 B → copy [A] [B]  
    A、B 可以放的東西
    * 目前設定：running-config
    * 開機載入的設定：startup-config
    * 快閃記憶體：flash

  * 將開機載入的設定刪掉 → erase startup-config
  * 列出flash檔案 → show flash
  * 顯示介面狀態 → show controllers [介面名稱]

* 組態設定模式：Router(config)#
  * 停止將不認識的指令當網址搜尋 → no ip domain lookup
  * 設定進入超權限模式的密碼 → enable password [密碼]
  * 設定進入超權限模式的密碼(加密) → enable secret [密碼]
  * 進入介面組態模式 → interface fastEthernet 0/0
  * 進入實體線路配置模式 → line console 0
  * 進入遠端線路配置模式 → line vty 0 4
  * 啟用登入 → login
  * 啟動密碼加密服務 → service password-encryption
  * 開機時將 startup-config 載入 → config-register 0x2102
  * 設定今日訊息 → banner motd [結束符號]
  * 設定名稱 → hostname [名稱]
  * 設定路由表 → ip route [想要去的網段] [想要去的網段遮罩] [下一個跳轉點（可為IP或是介面編號）]
  * 進入子介面組態設定 → interface FastEthernet 0/0.[數字]

* 介面組態模式設定：Router(config-if)#
  * 開機 → no shutdown
  * 設定IP → ip address [IP] [遮罩]

* 線路(實體 or 遠端)配置模式：Router(config-line)#
  * 設定密碼 → password [密碼]
  * 啟用登入 → login

* 維護模式：rommon 1> (進入方式：開機中按「ctrl+break」)
  * 開機時不要將 startup-config 載入 → confreg 0x2142
  * 重開機 → reset

* 子介面組態模式設定：Router(config-subif)#
  * 設定封包格式 → encapsulation dot1Q [vlan幾]
  * 設定IP → ip address [IP] [遮罩]
