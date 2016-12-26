# AD class

## 觀念

* AD forest
* AD domain

  * 越少越好

* 驗證 != 授權
* OU: organization unit (工作地點、部門)
  ```
  abc.com
  |
  |
  --- sales
  |     |
  |     |
  |     --- Alex
  |
  --- maketing
  ```
* 雲端運算：透過網路提供服務
* Domain controllers (DC): 帳號驗證

  * Kerbersos authentication service: 時間誤差小於 5 分鐘
  * 最少要有兩台 DC
  * 兩台 DC 最少複寫時間 15 秒
  * DC 內容完全複寫沒有大小權限之分

* Windows server 帳號密碼路徑

  * `C:\Windows\System32\config\SAM`

* AD DS datebase

  1. scherma: 定義物件屬性......
  2. configuration: AD's setting
  3. Domain: User accounts, groups, computer at this domain
  4. application

## 步驟

* 安裝 AD 網域服務（ADDS） --> 伺服器管理員 / 新增角色
* AD 網路服務安裝精靈

  * **Domain name 一定要有點，不然會死人**
  * Domain name 不一定要是你申請的

## 訣竅

* 立即更新設定：`gpupdate /force`
