@echo off
T:
cd T:\PAPERSTUDIOS\APPDATA\APP-STORE
for /F "tokens=*" %%A in (FILETABLE-AV100.INT) do IF NOT EXIST %%A (goto error)
echo no error
pause
exit 0
:error
echo error
pause