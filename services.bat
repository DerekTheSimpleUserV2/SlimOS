@echo off
title SlimOS - Services
color 0B

echo ==============================
echo          SlimOS
echo      Optimize Services
echo ==============================
echo.
echo This will disable some optional services.
echo Windows Update, Network and Bluetooth
echo services will NOT be modified.
echo.
pause

echo.
echo Disabling optional services...
echo.

:: Fax
sc stop Fax >nul 2>&1
sc config Fax start= disabled >nul 2>&1

:: Retail Demo
sc stop RetailDemo >nul 2>&1
sc config RetailDemo start= disabled >nul 2>&1

echo.
echo Services configuration completed.
echo.
pause
