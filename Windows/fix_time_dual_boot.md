# 修改雙系統（ Windows and Linux ）時間會不正確的情況

* 以系統管理員執行命令提示字元  
  輸入：`reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f`
