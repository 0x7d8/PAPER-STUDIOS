@echo off
title BOOT 200

set theme=0
set stries=3

call C:\PAPERDRIVE.CMD

if exist %drive%:\PAPERSTUDIOS\TEMP\ (
    goto con1
) else (
    mkdir %drive%:\PAPERSTUDIOS\TEMP\
    goto con1
)
:con1
if exist %drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\SAVED\ (
    goto connocr
) else (
    mkdir %drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\SAVED\
echo 0 > SAVED\THEME.VAR
echo 3 > SAVED\TRIES.VAR
    goto connocr
)
:connocr
FOR /F "delims=|" %%f in (versions\app.ver) DO (
set appv=%%f
)

call DWNLD.CMD https://github.com/rotvproHD/PAPER-STUDIOS/raw/main/PROGRAMS/PAPER-APP-STORE/VERSION -saveTo %drive%:\PAPERSTUDIOS\TEMP\ONLINEV.TMP
FOR /F "delims=|" %%f in (%drive%:\PAPERSTUDIOS\TEMP\ONLINEV.TMP) DO (
set oappv=%%f
)

:bootnormal

: : COPYPROTECTION
if exist "-A-A-madebypaperstudios" (
goto boot
) else (
:no2
echo.
echo [!] NOT AN OFFICIAL UNMODIFIED VERSION
echo     TO FIX PLEASE  REINSTALL   VERSION
echo %lang-g-pause%
pause>nul
cls
goto no2
)
:boot

: : Settings
set inproname=APP-STORE
set dvariables=3
set activatedelay=true
set startingtext=true
set directory=%drive%:\PAPERSTUDIOS\APPDATA\APP-STORE\
cd %directory%

: : Read Boot Version and App Version
FOR /F "delims=|" %%f in (versions\booter.ver) DO (
echo [i] PAPER PROGRAM BOOTER v%%f
echo.
)
FOR /F "delims=|" %%f in (versions\app.ver) DO (
echo [i] PAPER STARTPACK  APP v%%f
echo.
)



: : Read Variables
FOR /F "delims=|" %%f in (SAVED\THEME.VAR) DO (
set theme=%%f
echo [i] LOADING [ 1 / %dvariables% ]
if %activatedelay% EQU true (
PING localhost -n 2 >NUL
)
)
FOR /F "delims=|" %%f in (SAVED\TRIES.VAR) DO (
set stries=%%f
echo [i] LOADING [ 2 / %dvariables% ]
if %activatedelay% EQU true (
PING localhost -n 2 >NUL
)
)
FOR /F "delims=|" %%f in (SAVED\LANGUAGE.VAR) DO (
set language=%%f
echo [i] LOADING [ 3 / %dvariables% ]
if %activatedelay% EQU true (
PING localhost -n 2 >NUL
)
)

set lang=ER
if %language% EQU GERMAN (
set lang=DE
)
if %language% EQU ENGLISH (
set lang=EN
)
if %language% EQU RUSSIAN (
set lang=RU
)

call LANGUAGES\ENGLISH.CMD
if exist LANGUAGES\%language%.CMD (
call LANGUAGES\%language%.CMD
)

if exist %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\ (
    goto vercheck
) else (
    mkdir %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\
    goto vercheck
)

:vercheck
if %appv% EQU %oappv% (
    goto starting
) else (
    goto update
)


: : Program Starting
:starting

if "%~1"=="" goto conboot
%1.bat
:conboot

if exist SAVED\VISITED.VAR (

if %startingtext% EQU true (
echo.
echo [i] STARTING
PING localhost -n 2 >NUL
echo.
start.bat
) else (
echo.
start.bat
)

) else (
    WELCOME.BAT
)

:update
messageupdate.bat