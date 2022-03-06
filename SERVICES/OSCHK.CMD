if %1 EQU version (
set sversion=100
goto end
) else (
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" EQU "11.0" (
set %1=11
goto end
)
if "%version%" EQU "10.0" (
set %1=10
goto end
)
if "%version%" EQU "6.3" (
set %1=81
goto end
)
if "%version%" EQU "6.2" (
set %1=8
goto end
)
if "%version%" EQU "6.1" (
set %1=7
goto end
)
set %1=0
)
:end