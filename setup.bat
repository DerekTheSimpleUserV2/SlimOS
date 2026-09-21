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
cls
echo ==============================
echo        Clean Windows
echo ==============================
echo.
echo Cleanup module is not ready yet.
pause
goto menu

:telemetry
cls
echo ==============================
echo       Reduce Telemetry
echo ==============================
echo.
echo Telemetry module is not ready yet.
pause
goto menu

:services
cls
echo ==============================
echo       Optimize Services
echo ==============================
echo.
echo Services module is not ready yet.
pause
goto menu

:apps
cls
echo ==============================
echo         Manage Apps
echo ==============================
echo.
echo Apps module is not ready yet.
pause
goto menu

:full
cls
echo ==============================
echo         Full Setup
echo ==============================
echo.
echo Full configuration is not ready yet.
pause
goto menu
