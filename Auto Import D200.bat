@ECHO off
mode con: cols=40 lines=7
cls
echo.
echo     Auto Importing Photos
echo.

if not exist "C:\Users\Chris\Pictures\Develop" mkdir "C:\Users\Chris\Pictures\Develop"

setlocal ENABLEDELAYEDEXPANSION
set month=%date:~5,2%
set /a theMonth=(%month%*3)-3
set monthText=JanFebMarAprMayJunJulAugSepOctNovDec

set finalMonth=!monthText:~%theMonth%,3!

echo     Importing from CF Card...
xcopy /s "N:\DCIM\101ND200\*" "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%\*">nul
for /f %%B in ('dir /a-d-s-h /b "N:\DCIM\101ND200" ^| find /v /c ""') do set count2=%%B
echo     %count2% from CF Card

start C:\Users\Chris\Pictures\Develop

echo.
echo     %count2% imported images
echo.
pause>nul