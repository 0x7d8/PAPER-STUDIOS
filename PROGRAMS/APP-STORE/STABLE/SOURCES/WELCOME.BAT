@echo off
cls
echo.
echo %lang-intro1%
echo %lang-intro2%
echo %lang-intro3%
echo %lang-intro4%
echo.
start /min SOUND.VBS "%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\LANGUAGES\WELCOME-%lang%.MP3"
echo %lang-g-pause%
pause>nul
echo true > SAVED\VISITED.VAR
START.BAT