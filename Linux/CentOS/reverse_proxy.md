# Reverse Proxy 反向代理伺服器

## 環境
> * CentOS 7
> * Nginx


## 什麼是反向代理伺服器

> 參考：<http://www.arthurtoday.com/2010/01/reverse-proxy-server.html>


## 在 CentOS 安裝 Nginx

> 新增檔案：`vim /etc/yum.repos.d/nginx.repo`
>
> * 檔案內容
> ```
> [nginx]
> name=nginx repo
> baseurl=http://nginx.org/packages/centos/7/$basearch/
> gpgcheck=0
> enabled=1
> ```
>
> 安裝：`yum install -y nginx`


## 設定

> 備份預設：`cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak`
>
> 設定檔案：`vim /etc/nginx/conf.d/default.conf`
>
> * 檔案內容
> ```
> server {
>     listen 80;
>     server_name aa.example.com
>     # 打 ip 時要加上分號
>     location / {
>         # 設定真實伺服器
>         proxy_pass http://192.168.0.10:80;
>
>         # 將Host設定為使用者訪問時使用的網域(aa.example.com)，
>         # 避免真實伺服器用網域作虛擬主機(Name-based Virtual Host)時無法作用
>         proxy_set_header Host $host;
>
>         # 自訂一個header變數，名稱可隨意設定，帶上使用者的 IP
>         proxy_set_header X-Real-IP $remote_addr;
>
>         # 加上中間經過的代理IP，逗號區隔(client, proxy1, proxy2...)
>         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
>     }
> }
> ```
> 註一：如果需要做 Virtual Host 將整段重新寫一次即可，或是可以另外新增設定檔  
> 　　　Ex. `example.com.conf`  
> 註二：如果在 `proxy_pass` 這個設定中需要指定資料夾，需要在後面加上 `/`  
> 　　　Ex. `http://192.168.0.10:3000/user/`
>
> 重新啟動 nginx：`systemctl restart nginx`  
> <center><h2>恭喜完成！</h2></center>


## 代解決問題

> 問題一
>> | 使用者 | <--> | 反向代理伺服器 | <--> | 網頁伺服器 |
>> | :---: | :---: | :---: | :---: | :---: |
>> | PC | <--> | reverse proxy | <--> | Server 1 |
>> | | | | <--> | Server 2 |
>>
>> 描述：`當被推到後面的 Server（Server 1 和 Server 2），使用的 port 號，不是 80 的時候會發生 502 錯誤`

## 參考資料來源

> * [Nginx proxy 反向代理 轉發Tomcat](http://blog.faq-book.com/?p=6745)
> * [nginx 設定反向代理伺服器](http://xyz.cinc.biz/2015/01/nginx-reverse-proxy.html)
> * [Nginx – Virtual Host 設定](http://blog.faq-book.com/?p=4645)
> * [Nginx Virtual Host 設定教學](https://blog.toright.com/posts/4355/nginx-virtual-host-%E8%A8%AD%E5%AE%9A%E6%95%99%E5%AD%B8.html)
