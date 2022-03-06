if %1 EQU version (
set sversion=100
goto end
) else (
Ping www.google.com -n 1 -w 1000
if errorlevel 1 (set %1=false) else (set %1=true)
)
:end