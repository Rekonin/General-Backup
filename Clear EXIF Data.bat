@echo off
cls
"C:\Users\Chris\Documents\Photo Tools\exiftool.exe" -all= --icc_profile:all -tagsfromfile @ -exif:ImageDescription -exif:DateTimeOriginal -exif:CreateDate -xmp:description="Photograph" -artist="Chris Norris chrisdnorris@gmail.com" -copyright="Chris Norris chrisdnorris@gmail.com" %1

pause