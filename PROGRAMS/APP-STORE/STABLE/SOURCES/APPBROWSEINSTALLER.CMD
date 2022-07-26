@echo off
set /a tries = 0
if exist %drive%:\PAPERSTUDIOS\TEMP\TEMPINSTALLER.EXE (
    del /q %drive%:\PAPERSTUDIOS\TEMP\TEMPINSTALLER.EXE
)
start /min appbrowseservice.cmd
:dal01
if %tries% EQU %stries% (
cls
echo [oooo] %lang-adl-toomanytries%
echo [000%tries%] %lang-adl-tries%
echo.
echo %lang-g-pause%
pause>nul
appbrowseappview.bat
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
start %drive%:\PAPERSTUDIOS\TEMP\TEMPINSTALLER.EXE
echo.
echo %lang-g-pause%
pause>nul
appbrowseappview.bat