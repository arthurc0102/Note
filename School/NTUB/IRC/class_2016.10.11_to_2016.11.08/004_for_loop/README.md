# for 迴圈

* 解釋！到底迴圈是啥？  
  迴圈就是會重複做事的程式碼

* 我聽不懂做給我看～

  ```python
  l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  #建立一個串列

  print(l)  # 印出全部

  for i in l:
      print(i)
  ```

  > `for i in l` 這行是在說：將 `l` 裡面的東西一個一個的取出來直到沒有為止
  >
  > `print(i)` 是在說將 `i` 印出來
  >
  > 所以執行到 `for i in l` 這行的時候他會將第一個在 `l` 裡面的值取出來放到 `i` 中，然後執行下一行，`print(i)` 這行執行完成後他會再回到 `for i in l` 這行，然後將 `l` 的第二個值放到 `i` 中，之後執行下一行直到 `l` 的最後一個值都被列出來為止
