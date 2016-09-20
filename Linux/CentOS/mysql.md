# install mysql


### 安裝
1. 下載：`wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm`
2. 加入套件庫：`rpm -ivh mysql-community-release-el7-5.noarch.rpm`
3. 更新套件庫：`yum update`
4. 安裝：`yum install mysql-server`


### 設定
* 啟動：`systemctl start mysqld`
* 開機啟動：`systemctl enable mysqld`
* 其他設定：`mysql_secure_installation`


### Login
* root login: `mysql -u root -p`


### Reset root password
1. stop mysql: `systemctl stop mysqld`
2. restart with not ask for password: `mysqld_safe --skip-grant-tables &`
3. login: `mysql -u root`
4. reset password:  
  ```
  use mysql  
  update user SET PASSWORD=PASSWORD("password") WHERE USER='root'  
  flush privileges   
  exit
  ```
5. start mysql: systemctl start mysqld
