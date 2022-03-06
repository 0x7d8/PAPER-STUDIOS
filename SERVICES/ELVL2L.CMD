if %1 EQU version (
set sversion=100
goto end
) else (
if %errorlevel% EQU 1 set %1=A
if %errorlevel% EQU 2 set %1=B
if %errorlevel% EQU 3 set %1=C
if %errorlevel% EQU 4 set %1=D
if %errorlevel% EQU 5 set %1=E
if %errorlevel% EQU 6 set %1=F
if %errorlevel% EQU 7 set %1=G
if %errorlevel% EQU 8 set %1=H
if %errorlevel% EQU 9 set %1=I
if %errorlevel% EQU 10 set %1=J
if %errorlevel% EQU 11 set %1=K
if %errorlevel% EQU 12 set %1=L
if %errorlevel% EQU 13 set %1=M
if %errorlevel% EQU 14 set %1=N
if %errorlevel% EQU 15 set %1=O
if %errorlevel% EQU 16 set %1=P
if %errorlevel% EQU 17 set %1=Q
if %errorlevel% EQU 18 set %1=R
if %errorlevel% EQU 19 set %1=S
if %errorlevel% EQU 20 set %1=T
if %errorlevel% EQU 21 set %1=U
if %errorlevel% EQU 22 set %1=V
if %errorlevel% EQU 23 set %1=W
if %errorlevel% EQU 24 set %1=X
if %errorlevel% EQU 25 set %1=Y
if %errorlevel% EQU 26 set %1=Z
)
:end