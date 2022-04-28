@echo off
if %directory% EQU 0 (
goto start
) else (
cd %directory%
goto start
)
:start
if exist %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\boot.bat (
    set status=1
) else (
    set status=0
)
if %installperm% EQU false (
    set status=3
)
if %cavert% EQU 0 (
    if exist %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\startpack.ver (
        FOR /F "delims=|" %%f in (%drive%:\PAPERSTUDIOS\APPDATA\%afpath%\startpack.ver) DO (
        set cavers=%%f
    )
)
) else (
    if exist %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\versions\app.ver (
        FOR /F "delims=|" %%f in (%drive%:\PAPERSTUDIOS\APPDATA\%afpath%\versions\app.ver) DO (
        set cavers=%%f
    )
)
)


title %lang-appname% - %uaname% %lang-t-appviewinfo%
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
if %status% EQU 1 (
set max=3
) else if %status% EQU 0 (
set max=2
) else (
set max=1
)
set sel=1
if %theme% EQU 1 (
set selcolor=0f
set defcolor=70
goto skip2nd
)
if %theme% EQU 0 (
set selcolor=8f
set defcolor=0f
)
:skip2nd
call :reset
call :setmenu
:refresh
:: redraw window
DCls 0
call :recolor
call :title
call :menu
call :below
set sel2=!sel!
DKey
if "%errorlevel%"=="13" call :action&goto refresh
if "%errorlevel%"=="40" set /a sel+=1&goto refresh
if "%errorlevel%"=="38" set /a sel-=1&goto refresh
goto refresh
:reset
:: reset variable
for /l %%i in (1 1 !max!) do set color%%i=!defcolor!
for /l %%i in (1 1 !max!) do set menu%%i=undefined
exit /b

:menu
:: display menu
color !defcolor!
for /l %%i in (1 1 !max!) do (
DCls x1
set /p ="!left!"<nul
DColor !color%%i!
set /p ="!menu%%i!"<nul
DColor !defcolor!
echo.!right!
)
exit /b

:title
echo.
echo  [i] %lang-av-name%:  %uaname%
if %status% EQU 1 (
echo  [i] %lang-av-status%:  %lang-as-installed%
)
if %status% EQU 0 (
echo  [i] %lang-av-status%:  %lang-as-notinstalled%
)
if %status% EQU 3 (
echo  [i] %lang-av-status%:  %lang-as-notinstallable%
)
echo.
echo  [i] %lang-av-size%:  %sizemb%MB
echo  [i] %lang-av-dev%:  %appdev%
echo  [i] %lang-av-frame%:  %appframe%
echo.
echo  [i] %lang-av-security%:  %security%
echo  [i] %lang-av-version%:  %cavers%
echo.  
echo. 
exit /b

:below
echo.
echo.
echo. %lang-g-selhelp1%
echo. %lang-g-selhelp2%
exit /b

:recolor
:: reset color
if !sel! lss 1 set sel=!max!
if !sel! gtr !max! set sel=1
set color!sel!=!selcolor!
if not !sel!==!sel2! (
set color!sel2!=!defcolor!
)
exit /b




:setmenu
:: set menu caption
if %status% EQU 1 (
set menu1=%lang-av-open%
) else if %status% EQU 0 (
set menu1=%lang-av-install%
) else (
set menu1=%lang-av-back%
)
if %status% EQU 1 (
set menu2=%lang-av-uninstall%
set menu3=%lang-av-back%
) else (
set menu3=%lang-av-uninstall%
set menu2=%lang-av-back%
)
set left=
set right=
exit /b




:action
if !sel!==5 (
if !no!==1 (
set selcolor=3f
set defcolor=70
)
if !no!==2 (
set selcolor=0b
set defcolor=0f
)
if !no!==3 (
set selcolor=8f
set defcolor=0f
set no=0
)
call :reset
call :setmenu
set /a no+=1
) else (
cls
if !sel! EQU 1 (

if %status% EQU 1 (
    start %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\boot.bat
)
if %status% EQU 0 (
    appbrowseinstaller.cmd
)
if %status% EQU 3 (
    cls
    %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE%PG%.CMD
)

)
if !sel! EQU 3 (

cls
%drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE%PG%.CMD

)
if !sel! EQU 2 (

if %status% EQU 1 (
if exist %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\UNINSTALLER.CMD (
    %drive%:\PAPERSTUDIOS\APPDATA\%afpath%\UNINSTALLER.CMD
    goto start
) else (
    cls
    echo.
    echo [i] %lang-g-error%
    echo     no uninstaller found
    echo.
    echo %lang-g-echo %lang-g-pause%
pause>nul%
    echo %lang-g-pause%
pause>nul>nul
    goto start
)


) else (
    cls
    %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE%PG%.CMD
)
)
)
exit /b