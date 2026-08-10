@echo off

REM Get today's date in YYYY-MM-DD format
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%i

REM Create today's folder
mkdir Results\%TODAY%

REM Run Robot Framework
robot -d Results\%TODAY% Tests\Regression.robot

pause