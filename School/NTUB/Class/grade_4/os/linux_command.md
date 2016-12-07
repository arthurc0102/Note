# Linux command

> 將 `[...]` 裡面的東西（包含括號）替換成對應的東西或是名稱

1. pwd: 顯示目前所在的目錄  
   你是 uesr01 ，你在你的家目錄
   ```bash
   pwd

   # output: /home/user01
   ```

2. mkdir: 建立目錄  
   ```bash
   mkdir [資料夾名稱]
   ```

   參數：
   * -v: 輸出結果
     ```bash
     mkdir -v dir1

     # output: mkdir: created directory 'dir1'
     ```
   * -p: 循環建立所需要的目錄
     
     ```bash
     mkdir dir1
     mkdir dir1/dir2  # 再沒有 dir1 的情況直接下這行會錯誤
     ```
     
     等於
     
     ```bash
     mkdir -p dir1/dir2  # 加上 -p 就可以直接下囉
     ```

3. ls: 顯示目前目錄下的檔案與目錄  
   ```
   目前架構

   .
   └── dir1
       └── dir2
           └── dir3
   ```

   ```bash
   ls

   # output: dir1
   ```

   參數：
   * -R: 顯示所有的檔案及目錄（包含子目錄）
     ```bash
     ls -R

     # output:
     #
     # .:
     # dir1
     #
     # ./dir1:
     # dir2
     #
     # ./dir1/dir2:
     # dir3
     #
     # ./dir1/dir2/dir3:  
     ```
   * -l: 條列顯示
     ```bash
     ls -l

     # output:
     #
     # 總計 4
     # drwxr-xr-x 3 arthur arthur 4096 10月 30 14:04 dir1
     ```

4. cd: 移動到其他目錄
   * `cd [目錄名稱]`
   * `cd ..`: 回到上一層
   * `cd -`: 回到上一層並輸出結果

5. touch: 建立檔案
   * touch [檔案名稱]

6. dir
   * 顯示目前目錄底下的目錄及檔案，同 `ls -C -b`

7. clear
   * 清除目前的螢幕

8. echo
   * 印出特定字串
     ```bash
     echo "Hello"

     # output: Hello
     ```
   * 將字串寫入檔案
     * 複寫（覆蓋檔案中的內容並寫入）
       ```bash
       echo "hello" > a.txt
       ```
     * 附加（寫在檔案最後）
       ```bash
       echo "hello" >> a.txt
       ```

9. 顯示檔案  
   檔案：a.txt
   ```
   1
   2
   3
   4
   5
   6
   7
   8
   9
   10
   11
   12
   13
   14
   15
   16
   17
   18
   19
   20
   ```
   1. cat
      ```bash
      cat a.txt

      # output:
      #
      # 1
      # 2
      # 3
      # 4
      # 5
      # 6
      # 7
      # 8
      # 9
      # 10
      # 11
      # 12
      # 13
      # 14
      # 15
      # 16
      # 17
      # 18
      # 19
      # 20
      ```

   2. head
      ```bash
      head a.txt

      # output:
      #
      # 1
      # 2
      # 3
      # 4
      # 5
      # 6
      # 7
      # 8
      # 9
      # 10
      ```

   3. tail
      ```bash
      tail a.txt

      # output:
      #
      # 11
      # 12
      # 13
      # 14
      # 15
      # 16
      # 17
      # 18
      # 19
      # 20
      ```

  > 在 head 或是 tail 加上 `-[行數]` 可指定顯示行數（預設 10 行）

  ```bash
  head -3 a.txt

  # output:
  #
  # 1
  # 2
  # 3

  tail -3 a.txt

  # output:
  #
  # 18
  # 19
  # 20
  ```

12. stat: 顯示檔案或是目錄的詳細資料
    ```bash
    stat [名稱]
    ```

13. cp: 複製檔案 -vr
    ```bash
    cp [來源檔] [目的地]
    ```

    參數
    * -v: 顯示結果
    * -r: 複製資料夾時要加上這個參數

14. mv: 移動檔案
    ```bash
    mv [來源檔] [目的地]
    ```

15. ln -s: 建立連結
    ```bash
    ln -s [要被建立連結的檔案或目錄] [建立連結的地方]
    ```

    > 要被建立連結的檔案或目錄必須是絕對位址

16. rm: 刪除
    ```bash
    rm [檔案名稱]
    ```

    參數：
    * -i: 刪除前確認
    * -r: 刪除資料夾時加上此參數
    * -f: 強制刪除

17. rmdir: 刪除「空」資料夾
