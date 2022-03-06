if %1 EQU version (
set sversion=100
goto end
) else (
for /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='%1:'" get FreeSpace /format:value`) do set %2=%%x
)
:end