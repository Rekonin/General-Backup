@ECHO off
cls
FOR /F "tokens=4" %%F IN ('""C:\Users\Chris\Documents\Photo Tools\exiftool.exe" -ShutterCount %1"') DO SET var=%%F

echo.
echo     Shutter Count of image: %var%
echo.

pause