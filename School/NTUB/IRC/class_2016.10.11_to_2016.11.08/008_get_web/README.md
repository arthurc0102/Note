# 用 requests 抓取網頁

* 在前面我們學會了如何下載套件也會匯入我們下載的套件了，那現在讓我們來用用吧～

  ```python
  import requests

  r = requests
  web = r.get('https://arthurc0102.github.io/test/')

  print(web.text)
  ```
