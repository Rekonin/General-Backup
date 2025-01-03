@ECHO off
mode con: cols=40 lines=7
cls
echo.
echo     Auto Importing Photos...
echo.

if not exist "F:\DCIM\101D3400" goto end
if not exist "G:\DCIM\101ND200" goto end
if not exist "C:\Users\Chris\Pictures\Develop" mkdir "C:\Users\Chris\Pictures\Develop"

setlocal ENABLEDELAYEDEXPANSION
set month=%date:~5,2%
set /a theMonth=(%month%*3)-3
set monthText=JanFebMarAprMayJunJulAugSepOctNovDec

set finalMonth=!monthText:~%theMonth%,3!

mkdir "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%"

if exist "F:\DCIM\101D3400" goto import1
:start
if exist "G:\DCIM\101ND200" goto import2
goto last

:import1
xcopy /s "F:\DCIM\101D3400" "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%"
goto start

:import2
xcopy /s "G:\DCIM\101ND200" "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%"

:last
start C:\Users\Chris\Pictures\Develop

:end
