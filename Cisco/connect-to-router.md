# Windows connect to router

## 使用軟體
* PuTTY
* USB-to-serial driver

## 作法
* 開啟裝置管理員（ WindowsKey + X ）
* 找到 Prolific USB-to-Serial Comm Port 驅動程式（在「連接埠 (COM 和 LPT)」裡面)
* 確認 COM 編號（通常預設為COM3）
* 以系統管理員身分執行putty
* 到選單最下面選擇 Serial 將 Serial line to connect to 的 COM 編號改成正確的，並將Flow controle改成None
* 在到 Session 選項中將 Connection type 選成 Serial，確認 Serial line 的 COM 編號是正確的
* 如果只要連結一次可直接點選 Open
* 如果想儲存連線設定可在 Saved Sessions 中輸入連線名稱，按下 Save 之後重新啟動程式，點兩下設定檔即可連線
