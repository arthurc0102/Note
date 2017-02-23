# get today data

```shell
for /f "tokens=2 delims==" %%G in ('wmic os get localdatetime /value') do set datetime=%%G
set today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%
```
