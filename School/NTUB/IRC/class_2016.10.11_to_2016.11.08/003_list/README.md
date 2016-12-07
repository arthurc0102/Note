# List （串列）

* Q: 串列是什麼？  
  A: 其實你可以把他想像成一個變數的集合

* Q: 為什麼需要串列？  
  A: 如果你要存放一個 50 人的班級的學期成績使用變數就需要 50 變數，但使用串列就只需要宣告一個就好囉～

* 說這個多，建立一個來看看咩！

  ```python
  l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ```

  > 好了我建完了
  >
  > 上面那句話就建立了一個串列，然後存放 1 到 10

* 來輸出串列吧！

  * 一次輸出全部

    ```python
    print(l)
    ```

    > 結果會長這樣 `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`

  * 一次輸出一個～

    ```python
    print(l[0])  # 輸出第一個
    print(l[1])  # 輸出第二個
    print(l[2])  # 輸出第三個
    ```

    > 以此類推...........

  * 一次輸出一個，然後輸出全部

    * 比較笨的方法

      ```python
      print(l[0])
      print(l[1])
      print(l[2])
      print(l[3])
      print(l[4])
      print(l[5])
      print(l[6])
      print(l[7])
      print(l[8])
      print(l[9])
      ```

      > 好了就這樣
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > .
      >
      > 喂！你根本就是拿一次輸出一個方法打十次而已嘛！然後我說那個聰明的方法呢？我不想當笨蛋呀！
      >
      > 既然你誠心誠意的問了我就大發慈悲的告訴你，我是說下一章節再跟你說 XD