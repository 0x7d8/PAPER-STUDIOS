@echo off
:start
title %lang-appname% - %lang-t-info%
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=1
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
echo  [i] DIESES PROGRAMM IST GENUTZT UM LEICHTE  RAPERSTUDIOS APPS
echo      ZU INSTALLIEREN.  DIESES PRODUKT IST GRATIS UND OFFIZIELL
echo      VERFUEGBAR UNTER      [https://cutt.ly/paperstudiosRL001]
echo      FUER DIE BESTE  ERFAHRUNG BITTE WINDOWS TERMINAL BENUTZEN
echo.
echo  [i] [AKTUELLE APP VERSION v%appv%   -   ONLINE APP VERSION v%oappv%]
echo.
echo. 
exit /b

:below
echo.
echo.
echo. 
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
set menu1=%lang-g-ok%
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

cls
start.bat

)

)
exit /b