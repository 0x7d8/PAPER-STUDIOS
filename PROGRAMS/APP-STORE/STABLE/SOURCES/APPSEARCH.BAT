@echo off
title %lang-appname% - %lang-t-direct%
echo.
echo [.] %lang-asc-title%
echo.
echo     %lang-asc-text1%
echo     %lang-asc-text2%
echo     %lang-asc-text3%
echo     %lang-asc-text4%
echo.
set /p "app=[:] "
cls
if exist %drive%:\PAPERSTUDIOS\Temp\TEMPINSTALLER.EXE (
    del /q %drive%:\PAPERSTUDIOS\Temp\TEMPINSTALLER.EXE
)
start /min appsearchservice.cmd
set tries=0
:dal01
if %tries% EQU %stries% (
cls
echo [oooo] %lang-adl-toomanytries%
echo [000%tries%] %lang-adl-tries%
echo.
echo %lang-g-pause%
pause>nul
start.bat
)
echo [oOoo] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
echo [ooOo] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
echo [oooO] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
echo [ooOo] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
echo [oOoo] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
echo [Oooo] %lang-adl-downloadtext%
echo [000%tries%] %lang-adl-tries%
PING localhost -n 2 >NUL
cls
if exist %drive%:\PAPERSTUDIOS\TEMP\TEMPINSTALLER.EXE (
    goto da01
) else (
set /a tries = %tries% + 1
    goto dal01
)
:da01
echo.
echo [i] %lang-adl-finish1%
echo     %lang-adl-finish2%
echo     %lang-adl-finish3%
echo     %lang-adl-finish4%
echo.
start %drive%:\PAPERSTUDIOS\Temp\TEMPINSTALLER.EXE
echo.
echo %lang-g-pause%
pause>nul
start.bat