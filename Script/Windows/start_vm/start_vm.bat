@echo off

set now_path=%~dp0
set vmrun_s=%now_path%\software\vmrun.exe
set vm_path=%now_path%\vm_path

cd %vm_path%

for /R %%i in (*.txt) do (
    for /F "USEBACKQtokens=*" %%j in (%%i) do (
        %vmrun_s% start "%%j"
    )
)
