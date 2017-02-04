# 轉 port

* 新增 port forward 規則使用：`firewall-cmd --zone=<你要設定的 zone> --add-forward-port=port=<連進來的 port>:proto=<要允許的協定>:toport=<轉入 IP 的 port>:toaddr=<轉入你要的 IP>`
  > 將規則存起來（重開機後依然存在）在上方指令下完後，在下一次但是後面多加上參數 `--permanent`

* 移除 port forward 規則使用 `–remove-forward-port` 參數

* 列出所有規則：`firewall-cmd --list-all`
