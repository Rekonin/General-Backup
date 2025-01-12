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

mkdir "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%"

if exist "F:\DCIM\101D3400" goto import1
set count1=0
:start
if exist "G:\DCIM\101ND200" goto import2
set count2=0
goto last

:import1
echo     Importing from SD Card...
xcopy /s "F:\DCIM\101D3400" "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%">nul
for /f %%A in ('dir /a-d-s-h /b "F:\DCIM\101D3400" ^| find /v /c ""') do set count1=%%A
echo     %count1% from SD Card
echo.
goto start

:import2
echo     Importing from CF Card...
xcopy /s "G:\DCIM\101ND200" "C:\Users\Chris\Pictures\Develop\%date:~0,4%.%month% %finalMonth% %date:~8,2%">nul
for /f %%B in ('dir /a-d-s-h /b "G:\DCIM\101ND200" ^| find /v /c ""') do set count2=%%B
echo     %count2% from CF Card

:last
start C:\Users\Chris\Pictures\Develop

:end
echo.
set /a "totalCount=%count1%+%count2%"
echo     %totalCount% total imported images
echo.
pause>nul
