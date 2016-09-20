# MySQL basic setting


### 允許外部 ip 連線
```
GRANT ALL PRIVILEGES ON *.* TO '[username]'@'[ip/mask]' IDENTIFIED BY '[password]' WITH GRANT OPTION;
flush privileges;
```
