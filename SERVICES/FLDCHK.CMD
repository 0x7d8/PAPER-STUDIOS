if %1 EQU version (
set sversion=100
goto end
) else (
if exist %1 goto end
mkdir %1
)
:end