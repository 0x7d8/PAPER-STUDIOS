@echo off
if %directory% EQU 0 (
goto start
) else (
cd %directory%
goto start
)
:start
cls
echo.
echo  %lang-mu-start1%
echo  %lang-mu-start2%
echo.
call DWNLD.CMD https://github.com/rotvproHD/PAPER-STUDIOS/raw/main/PROGRAMS/PAPER-APP-STORE/APPSIZE -saveTo %drive%:\PAPERSTUDIOS\TEMP\APPSIZE.TMP
FOR /F "delims=|" %%f in (%drive%:\PAPERSTUDIOS\TEMP\APPSIZE.TMP) DO (
set filemb=%%f
)
PING localhost -n 3 >NUL
cls
title %lang-appname% - %lang-t-mupdate%
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=2
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
echo  [i] %lang-mu-title%
echo.
echo  [i] %lang-mu-cver% V%appv%
echo  [i] %lang-mu-over% V%oappv%
echo.
echo  [i] %lang-mu-size% %filemb%MB
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
set menu1=%lang-ub-install%
set menu2=%lang-ub-ignore%
set left=
set right=
exit /b




:action
call :reset
call :setmenu
set /a no+=1
) else (
cls
if !sel! EQU 1 (

cls
echo.
echo  %lang-mu-pleasewait1%
echo  %lang-mu-pleasewait2%
call DWNLD.CMD https://github.com/rotvproHD/PAPER-UPAI/raw/main/appfiles/updateservice.bat -saveTo %drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\updateservice.bat
PING localhost -n 3 >NUL
updateservice.bat


)
if !sel! EQU 2 (

cls
start.bat

)

)
exit /b