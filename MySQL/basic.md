# MySQL basic setting


### Allow outline ip connect
```
GRANT ALL PRIVILEGES ON *.* TO '[username]'@'[ip/mask or XXX.XXX.%]' IDENTIFIED BY '[password]' WITH GRANT OPTION;
flush privileges;
```

### Import sql file
* command: `mysql -u [username] -p [database name (optional)] < [sql file];`


### List database
* command: `show databases;`


### User
* add:
  ```
  CREATE USER 'assist'@'localhost';
  CREATE USER 'assist'@'192.168.%';
  SET PASSWORD FOR 'assist'@'localhost' = PASSWORD('newpass');
  SET PASSWORD FOR 'assist'@'192.168.%' = PASSWORD('newpass');
  ```

* set Competence:
  ```
  CREATE ROLE 'web';
  GRANT RELOAD ON *.* TO 'web';
  GRANT SELECT, UPDATE, REFERENCES, CREATE TEMPORARY TABLES, SHOW VIEW ON `mission`.* TO 'web';
  GRANT web to 'assist'@'localhost';
  GRANT web to 'assist'@'192.168.%';
  ```


### Database
* add: `CREATE DATABASE [name] DEFAULT CHARACTER SET [char set (utf8)];`
* delete: `DROP DATABASE [name];`


### reference website
* <https://github.com/lambdaTW/assist-db/blob/master/schema.sql>
