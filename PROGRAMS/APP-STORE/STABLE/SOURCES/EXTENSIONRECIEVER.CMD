@echo off
setlocal enabledelayedexpansion
set Counter=1
for /f %%x in (%1) do (
  set "Line_!Counter!=%%x"
  set /a Counter+=1
)
set /a NumLines=Counter - 1
rem or, for arbitrary file lengths:
for /l %%x in (1,1,%NumLines%) do echo !Line_%%x!
pause