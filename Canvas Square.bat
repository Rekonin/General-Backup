@echo off
cls
for %%f in (*.jpg) do "C:\Users\Chris\Documents\Photo Tools\bin\ffmpeg.exe" -i "%%f" -vf pad="iw+160:ih+160:-1:-1:aspect=1/1:color=white[m]" "%%~nf_canvas.jpg"