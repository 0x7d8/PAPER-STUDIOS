@echo off
title %lang-appname% - %lang-g-error%
type IMAGES\ERROR.ACI
echo.
echo.
echo   [i] %lang-g-error%
echo       %errorcode%
echo.
echo   %lang-g-pause%
start /min SOUND.VBS "%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\SOUNDS\ERROR.MP3"
pause>nul
start.bat