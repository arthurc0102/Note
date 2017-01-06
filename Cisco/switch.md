# Cisco Switch 設定 指令

* 一般模式：Switch>
  * 進入超權限模式 → enable

* 超權限模式：Switch#
  * 顯示vlan狀態 → show vlan
  * 進入組態模式設定 → configure terminal

* 組態設定模式：Switch(config)#
  * 進入介面組態模式 → interface [介面名稱] [數字]
  * 進入 vlan 組態模式 → vlan [數字]

* 介面組態模式設定：Router(config-if)#
  * 定義介面角色 → switchport mode [access/trunk]
  * 設定歸屬哪個vlan → switchport access vlan [數字]

* vlan組態模式設定：Switch(config-vlan)#
  * 設定vlan名稱 → name [名稱]
