# 更換 tomcat web root

* 檔案：`server.xml`  
  ```xml
  .
  .
  .
  <host>
    .
    .
    .
    <Context path="{ url }" docBase="{ folder for web }" debug="0" reloadable="true"/>
    .
    .
    .
  </host>
  .
  .
  .
  ```
