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
DEL "%dest%\you_are_hacked*.jpg"
echo All cleaned up!
echo self destruct
DEL "%dest%\friendly_reverser.bat"
