@echo off

call C:\PAPERDRIVE.CMD
%drive%:
cd %drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\
echo %cd%
pause

:start
title UPAI INSTALLEUR
setlocal enabledelayedexpansion
mode con cols=100 lines=30
set no=1
:: properties
set max=2
set defcolor=0f
set sel=1
set selcolor=8f
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
echo  UPAI INSTALLEUR
echo.  
echo  [i] PAPER T INSTALLER v301
echo      PAPER INT APP VER v281
echo. 
exit /b

:below
echo.
echo.
echo. BITTE MIT PFEILTASTEN AUSWAEHLEN
echo. ZUM BESTAETIGEN [ENTER] DRUECKEN
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
set menu1=INSTALLIEREN
set menu2=ABBRECHEN   
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
goto done

)
if !sel! EQU 2 (

cls
exit

)

)
exit /b

:done
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\PAPER APP STORE.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.WorkingDirectory = "%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\" >> %SCRIPT%
echo oLink.TargetPath = "%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\nlboot.bat" >> %SCRIPT%
echo oLink.IconLocation = "%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\ICONS\APP.ICO" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
assoc .pasi=paper.app.store.app
Ftype paper.app.store.app=%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\EXTENSIONRECIEVER.CMD %1
echo Windows Registry Editor Version 5.00 >>%drive%:\PAPERSTUDIOS\TEMP\ICOSET.REG
echo [HKEY_CLASSES_ROOT\.pasi\DefaultIcon\] >>%drive%:\PAPERSTUDIOS\TEMP\ICOSET.REG
echo "(Default)"="%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\ICONS\FILE.ICO" >>%drive%:\PAPERSTUDIOS\TEMP\ICOSET.REG
%drive%:\PAPERSTUDIOS\TEMP\ICOSET.REG
cls
echo.
echo  [i] FERTIG!
echo      SIE FINDEN DIE APP NUN AUF
echo      IHREM DESKTOP!
echo.
echo %lang-g-pause%
pause>nul
exit