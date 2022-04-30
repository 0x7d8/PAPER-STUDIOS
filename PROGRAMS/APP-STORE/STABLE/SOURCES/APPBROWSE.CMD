@echo off
title %lang-appname% - %lang-t-loadingpages%
echo.
echo  [i] %lang-abd-downpages%
echo           ....
echo.
call DWNLD.CMD https://raw.githubusercontent.com/rotvproHD/PAPER-UPAI/main/Pages/pageinfos -saveTo %drive%:\PAPERSTUDIOS\TEMP\PGINF.TMP
echo  [i] %lang-adb-pageinfod%
if exist %drive%:\PAPERSTUDIOS\TEMP\pginf.tmp (
FOR /F "delims=|" %%f in (%drive%:\PAPERSTUDIOS\TEMP\pginf.tmp) DO (
set pages=%%f
echo  [i] %lang-adb-pageinfop%
goto pginfd
)
) else (
set "errorcode=01x1101"
errormenu.bat
)
:pginfd
if %pages% GTR 0 (
call DWNLD.CMD "https://github.com/rotvproHD/PAPER-STUDIOS/raw/main/PROGRAMS/PAPER-APP-STORE/PAGES/PAGE1.CMD" -saveTo %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE1.CMD
echo.
echo  [i] %lang-adb-pagedownl%
)
if %pages% GTR 1 (
call DWNLD.CMD "https://github.com/rotvproHD/PAPER-STUDIOS/raw/main/PROGRAMS/PAPER-APP-STORE/PAGES/PAGE2.CMD" -saveTo %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE2.CMD
echo.
echo  [i] %lang-adb-pagedownl%
)
if %pages% GTR 2 (
call DWNLD.CMD "https://github.com/rotvproHD/PAPER-STUDIOS/raw/main/PROGRAMS/PAPER-APP-STORE/PAGES/PAGE3.CMD" -saveTo %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE3.CMD
echo.
echo  [i] %lang-adb-pagedownl%
)
%drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE\PAGE1.CMD
echo.
if exist %drive%:\PAPERSTUDIOS\TEMP\APP-STORE-CACHE (
set "errorcode=01x1102"
errormenu.bat
) else (
set "errorcode=01x1103"
errormenu.bat
)
set "errorcode=01x1104"
errormenu.bat