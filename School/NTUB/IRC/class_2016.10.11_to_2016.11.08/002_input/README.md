# 輸入

* 之前講了輸出是讓 python 說說話，現在換你和 python 說說話吧～

  輸入的語法：

  ```python
  input('input anything: ')
  ```

* 讓 python 當一隻鸚鵡吧（重複你說的話）

  ```python
  my_input = input('input anything: ')

  print(my_input)
  ```

  > 上面的程式將你輸入的東西放到 `my_input` 這個變數裡面，在將其輸出

* 來做個加法吧～

  ```python
  number_1 = input('input number 1: ')
  number_2 = input('input number 2: ')

  print(number_1 + number_2)
  ```

  > 上面的程式會將你輸入的兩個東西黏在一起，但你會發現他就只是把他黏在一起而已（說好的加法呢？

  所以我們來看看下面這個程式吧～

  ```python
  number_1 = int(input('input number 1: '))
  number_2 = int(input('input number 2: '))

  print(number_1 + number_2)
  ```

  > 上面這個程式就真的會將數字加起來了喔～因為我們用了 `int()` 把輸入的東西轉換成了數字
