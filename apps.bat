@echo off
title SlimOS - Apps
color 0B

echo ==============================
echo           SlimOS
echo       Remove Unwanted Apps
echo ==============================
echo.
echo This will remove selected optional
echo Windows applications.
echo.
pause

echo.
echo Removing selected apps...
echo.

:: Microsoft Solitaire Collection
winget uninstall --id 9WZDNCRFJ3TX --silent >nul 2>&1

:: Xbox Game Bar
winget uninstall --id 9NZKPSTSNW4P --silent >nul 2>&1

:: Microsoft Bing Weather
winget uninstall --id 9WZDNCRFJ3Q2 --silent >nul 2>&1

:: Microsoft Bing News
winget uninstall --id 9WZDNCRFJ5Z4 --silent >nul 2>&1

echo.
echo App cleanup completed.
echo.
pause

