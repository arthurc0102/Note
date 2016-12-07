# 匯入 import

* 當我們安裝了一些套件或是想從其他檔案匯入自己寫的東西時我們就可以使用 import 來達到目的

  比方說：

  ```python
  import requests
  ```

  這樣我們就可以使用剛剛安裝的 requests 套件囉～

* 我們可以 import 別人的套件當然我們也可以 import 自己的，試試看吧

  檔案 1:

  ```python
  a = 10
  b = 20
  ```

  檔案 2

  ```python
  import file_1


  a = file_1.a
  b = file_1.b

  print(a)
  print(b)
  print(a + b)
  ```

  檔案 3

  ```python
  from file_1 import a, b


  print(a)
  print(b)
  print(a + b)
  ```

  > file_2 與 file_3 都從 file_1 匯入 a, b 兩個變數，只是方法不同
