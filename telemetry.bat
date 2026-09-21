@echo off
title SlimOS - Telemetry
color 0B

echo ==============================
echo          SlimOS
echo       Reduce Telemetry
echo ==============================
echo.
echo Applying privacy settings...
echo.

:: Disable Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul

:: Disable tailored experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul

:: Set Windows diagnostic data policy
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f >nul

echo.
echo Privacy settings applied.
echo.
echo Some Windows diagnostic data may still be
echo required for security, updates and functionality.
echo.
pause
