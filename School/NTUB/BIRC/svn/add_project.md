# add svn project

> 建立 svn 專案

1. 下指令
  ```sh
  cd /var/www/svn
  svnadmin create <專案名>
  chown -R apache:apache <專案名>/
  chcon -R -t httpd_sys_content_t <專案名>/
  chcon -R -t httpd_sys_rw_content_t <專案名>/
  ```

2. 在 `/var/ww/svn/<專案名>/conf/authz` 檔案中加入
  ```
  # add auth dir
  [/]
  # add auth user
  <username> = <權限>  # ex. user1 = rw
  * =  # 其他人都不能看
  ```

3. 在 `/etc/httpd/conf.d/subversion.conf` 檔案中加入
  ```
  <Location /<專案名>
          DAV svn
          SVNPath /var/www/svn/<專案名>/
          AuthType Basic
          AuthName "Subversion repos"
          AuthUserFile /etc/svn-auth-conf  # 帳號密碼
          AuthzSVNAccessFile /var/www/svn/<專案名>/conf/authz
          Require valid-user
  </Location>
  ```

4. 重新啟動服務
  ```sh
  systemctl restrat httpd
  ```
