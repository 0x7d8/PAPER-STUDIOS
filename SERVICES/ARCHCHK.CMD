if %1 EQU version (
set sversion=100
goto end
) else (
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS% EQU 32BIT (
set %1=32
goto end
) else (
set %1=64
goto end
)
)
:end
