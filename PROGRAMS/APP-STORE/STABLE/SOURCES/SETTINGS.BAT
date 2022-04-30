@echo off
if %directory% EQU 0 (
goto start
) else (
cd %directory%
goto start
)
:start
if exist C:\PAPERSTUDIOS\APPDATA\APP-STORE (
    set betass=%lang-as-installed%
) else (
    set betass=%lang-as-notinstalled%
)
title %lang-appname% - %lang-t-options%
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=4
set sel=%max%
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
echo  %lang-appname% %lang-t-options%
echo.
if %theme% EQU 0 (
    echo  %lang-o-theme%: %lang-ov-dark%
) else (
    echo  %lang-o-theme%: %lang-ov-bright%
)
echo  %lang-o-tries%: %stries%
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
set menu1=%lang-ob-theme%
set menu2=%lang-ob-tries%
set menu3=%lang-ob-language%
set menu4=%lang-ob-back%
set left=
set right=
exit /b




:action
if !sel!==1 (
if %theme%==0 (
set selcolor=0f
set defcolor=70
set theme=1
echo 1 > saved\THEME.VAR
goto start
)
if %theme%==1 (
set selcolor=8f
set defcolor=0f
set theme=0
echo 0 > saved\THEME.VAR
goto start
)
call :reset
call :setmenu
set /a no+=1
) else (
cls

if !sel! EQU 2 (

cls
echo.
echo [i] %lang-ot-tries%
echo.
set /p "stries=[:] "
echo %stries% > saved\TRIES.VAR
cls
exit /b

)

)

if !sel! EQU 3 (

cls
languageswitch.bat

)

if !sel! EQU 4 (

cls
start.bat

)

)
exit /b