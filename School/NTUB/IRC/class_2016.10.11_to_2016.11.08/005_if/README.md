# if 選擇

* 再做事情的過程中總是會面臨選擇程式也是一樣的，當你面臨選擇的問題的時候 `if` 就可以幫你過濾、選擇

* 做做看吧，以上一章節的範例為例子，如果我只要輸出偶數要怎麼做呢？

  ```python
  l = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  #建立一個串列

  print(l)  # 印出全部

  for i in l:
      if i % 2 == 0:  # '%' 符號是指取餘數的意思，然後 '==' 就是判斷左邊與右邊是否相等
        print(i)
  ```

  > 上面的程式可以發現 `if` 的架構如下
  >
  > ```python
  > if [條件]:
  >     [符合條件的話執行這個部份]
  > ```

* 你以為每次都只有對的時候才需要做事嗎？你人生都沒這麼單純了，程式也是一樣的（？）

  ```python
  if [條件一]:
      [符合條件一就執行]
  elif [條件二]:  # 可視情況省略，或是有很多個
      [符合條件二就執行]
  else:
      [不是條件一、二的就執行]
  ```
