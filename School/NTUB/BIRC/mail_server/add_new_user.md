# 在現有的 domain mail 中新增使用者

1. 在 `/etc/postfix/vmailbox` 新增東西，格式 `<user>@<domain> <domain>/<user>/`

2. 利用指令產生加密的密碼: `doveadm pw -s SHA512-CRYPT`

3. 設定使用者帳號密碼檔 `/etc/dovecot/users` 新增使用者，格式 `<user>@<domain>:<指令產生的東西>::::`  
   PS: 最後的四個 ":" 記得要加

4. 更新並重啟服務：

   * postmap /etc/postfix/vmailbox

   * systemctl restart postfix
   
   * systemctl restart dovecot
