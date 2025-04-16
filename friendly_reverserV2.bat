@echo off
echo finding divice language...
setlocal EnableDelayedExpansion

:: If info.txt exists, read language from its first line; otherwise, detect from systeminfo.
if exist "%APPDATA%\info.txt" (
    for /f "usebackq delims=" %%L in ("%APPDATA%\info.txt") do (
        set "lang=%%L"
        goto gotLang
    )
) else (
    echo info.txt not found, detecting language...
    for /f "tokens=2 delims=:" %%a in ('systeminfo ^| find "System Locale:"') do set locale=%%a
    set locale=%locale: =%
    set "lang=%locale%"
)
:gotLang
echo Detected language: %lang%

:: Determine home screen folder based on the language
if /I "%lang:~0,5%"=="nl-NL" (
    set startscreen=Bureaublad
) else (
    set startscreen=Desktop
)

set "dest=%USERPROFILE%\%startscreen%"
echo Reversing Damage...
DEL "%dest%\you_are_hacked*.png"

echo getting original wallpaper path...
:: Read the wallpaper path from %USERPROFILE%\info.txt (skip the first language line)
set "bgPath="
for /f "usebackq skip=1 delims=" %%B in ("%APPDATA%\info.txt") do (
    set "bgPath=%%B"
    goto gotPath
)
:gotPath
echo Background Path: !bgPath!
echo Restoring original wallpaper...
powershell -Command "Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'!bgPath!',3)"
echo !bgPath!

echo deleting info.txt...
DEL "%APPDATA%\info.txt"

echo All cleaned up!
echo self destruct
DEL "%dest%\friendly_reverser.bat"
