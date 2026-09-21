@echo off
title SlimOS
color 0B

:menu
cls
echo ==============================
echo            SlimOS
echo ==============================
echo.
echo [1] Clean Windows
echo [2] Reduce Telemetry
echo [3] Optimize Services
echo [4] Manage Apps
echo [5] Full Setup
echo [6] Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto cleanup
if "%choice%"=="2" goto telemetry
if "%choice%"=="3" goto services
if "%choice%"=="4" goto apps
if "%choice%"=="5" goto full
if "%choice%"=="6" exit

goto menu

:cleanup
call "%~dp0cleanup.bat"
goto menu

:telemetry
call "%~dp0telemetry.bat"
goto menu

:services
call "%~dp0services.bat"
goto menu

:apps
call "%~dp0apps.bat"
goto menu

:full
cls
echo ==============================
echo          SlimOS Full Setup
echo ==============================
echo.
echo Full Setup is not ready yet.
echo.
pause
goto menu
