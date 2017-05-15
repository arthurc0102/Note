@ECHO OFF
CLS
MODE CON COLS=75 LINES=18
SETLOCAL ENABLEDELAYEDEXPANSION
TITLE  Windows 7 SP1(x86) §ó·s¥] Update Package [WanMP]
ECHO  §ó·sµ{§Ç¤w±Ò°Ê¦¨¥\!
FOR /f "usebackq" %%i IN (`dir /b .\*.msu ^| find /c "msu"`) do set /a "TOTAL=%%i"
set /a "CURRENT=1"
FOR /f %%i in ('dir /b .\*.msu') do (
CLS
ECHO.
set /a "PERCENT=!CURRENT!*100/!TOTAL!"
ECHO ¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@¡@  WanMP Online System
ECHO.
ECHO   ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù
ECHO                                            ¦w¸Ë¶i«×¡G!PERCENT!/100
ECHO.
ECHO   ¥¿¦b¦w¸Ë²Ä !CURRENT! ­Ó§ó·s¡AÁ`¦@ %TOTAL% ­Ó§ó·s¡C
ECHO.
ECHO   ¥¿¦b¦w¸Ë "%%i" ½Ðµy­Ô ... Please Wait ...
ECHO   ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù
ECHO.
ECHO ¡@http://wmos.info/
ECHO.
start /wait .\%%i /quiet /norestart > nul
set /a "CURRENT+=1"
CLS
)
EXIT
