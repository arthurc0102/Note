# SSL for tomcat

* On Linux server
  1. 按照教學申請 ssl: <https://certbot.eff.org/#ubuntuxenial-other>

  2. 再來利用下面指令產生 `fullchain_and_key.p12`  
     ```shell
     openssl pkcs12 -export -in fullchain.pem -inkey privkey.pem -out fullchain_and_key.p12 -name tomcat
     ```
     上面會問密碼 (假設只用: tomcat_ssl)

* On Windows server
  1. 利用下面指令產生 `MyDSKeyStore.jks`
     ```shell
     keytool -importkeystore -deststorepass tomcat123456 -destkeypass tomcat123456 -destkeystore MyDSKeyStore.jks -srckeystore fullchain_and_key.p12 -srcstoretype PKCS12 -srcstorepass tomcat123456 -alias tomcat
     ```

  2. 將 `MyDSKeyStore.jks` 放在某處 (假設放在 `C:\`)

  3. 在 tomcat 設定檔案 `server.xml` 的  
     ```xml
     <Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
     ```
     下方貼上
     ```xml
     <Connector port="443" protocol="org.apache.coyote.http11.Http11Protocol"
           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
           clientAuth="false" sslProtocol="TLSv1.2"
           URIEncoding="UTF-8" useBodyEncodingForURI="true"
           sslEnabledProtocols="TLSv1.2,TLSv1.1,TLSv1"
           allowUnsafeLegacyRenegotiation="false"
           ciphers="TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,
           TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384,
           TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,
           TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256,
           TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,
           TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,
           TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384,
           TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,
           TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,
           TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,
           TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,
           TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA"
           keyAlias="tomcat"
           keyPass="tomcat_ssl"
           keystoreFile="C:\MyDSKeyStore.jks"
           keystorePass="tomcat_ssl"/>
     ```
     在將設定檔中其他 `8433` 改成 `443`
