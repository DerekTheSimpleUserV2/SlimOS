@echo off
title SlimOS - Cleanup
color 0B

echo ==============================
echo          SlimOS
echo        Windows Cleanup
echo ==============================
echo.
echo Cleaning temporary files...
echo.

del /q /f "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

del /q /f "%SystemRoot%\Temp\*" >nul 2>&1
for /d %%D in ("%SystemRoot%\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo Cleanup completed.
echo.
pause
