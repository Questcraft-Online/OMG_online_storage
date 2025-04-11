@echo off
echo finding divice language...
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| find "System Locale:"') do set locale=%%a
set locale=%locale: =%
if /I "%locale:~0,5%"=="nl-NL" (
    set startscreen=Bureaublad
) else (
    set startscreen=Desktop
)

set "dest=%USERPROFILE%\%startscreen%"
echo Reversing Damage...
DEL "%dest%\you_are_hacked*.png"
echo All cleaned up!
echo Restoring original wallpaper...
powershell -Command "$backup = Get-ChildItem -Path $env:USERPROFILE -Filter 'background.*' -ErrorAction SilentlyContinue | Select-Object -First 1; if($backup){Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,$backup.FullName,3); Remove-Item $backup.FullName}"
echo self destruct
DEL "%dest%\friendly_reverser.bat"
