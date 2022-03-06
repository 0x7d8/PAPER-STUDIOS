if %1 EQU version (
set sversion=100
goto end
) else (
@For /F "EOL=H Tokens=3" %%G In ('%SystemRoot%\System32\reg.exe Query
 "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
 /V "SystemUsesLightTheme" 2^>NUL'
) Do @If %%G Equ 0 (set %1=1) Else set %1=0
)
:end