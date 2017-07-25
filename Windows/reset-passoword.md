# Reset Windows Password

1. 用 USB 開機
2. 開啟命令提示字元
3. 執行下面的指令：
   ```shell
   d:
   cd windows\system32
   move Utilman.exe Utilman.exe.old
   copy cmd.exe Utilman.exe
   ```
4. 重新開機點選左下角的按鈕
5. 重新設定密碼：`net user administrator *`
