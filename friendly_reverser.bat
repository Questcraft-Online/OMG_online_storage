@echo off
echo Reversing prank...
DEL "%USERPROFILE%\Desktop\hacked_*.png"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
echo All cleaned up!
echo self destruct
DEL "%USERPROFILE%\Desktop\friendly_reverser.bat"
pause
