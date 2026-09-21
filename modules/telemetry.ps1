```powershell
function Start-SlimOSTelemetry {

    Write-Host ""
    Write-Host "============================="
    Write-Host "       SlimOS Telemetry"
    Write-Host "============================="
    Write-Host ""

    Write-Host "Reduciendo telemetría configurable..."
    Write-Host ""

    # Política de diagnóstico
    $DiagPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

    if (-not (Test-Path $DiagPath)) {
        New-Item -Path $DiagPath -Force | Out-Null
    }

    # Limitar los datos de diagnóstico
    New-ItemProperty `
        -Path $DiagPath `
        -Name "AllowTelemetry" `
        -PropertyType DWord `
        -Value 1 `
        -Force | Out-Null

    Write-Host "  Diagnóstico configurado."

    # Desactivar experiencias personalizadas basadas en datos de diagnóstico
    $PrivacyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy"

    if (-not (Test-Path $PrivacyPath)) {
        New-Item -Path $PrivacyPath -Force | Out-Null
    }

    New-ItemProperty `
        -Path $PrivacyPath `
        -Name "TailoredExperiencesWithDiagnosticDataEnabled" `
        -PropertyType DWord `
        -Value 0 `
        -Force | Out-Null

    Write-Host "  Experiencias personalizadas desactivadas."

    # Desactivar el Advertising ID del usuario
    $AdvertisingPath = `
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"

    if (-not (Test-Path $AdvertisingPath)) {
        New-Item -Path $AdvertisingPath -Force | Out-Null
    }

    New-ItemProperty `
        -Path $AdvertisingPath `
        -Name "Enabled" `
        -PropertyType DWord `
        -Value 0 `
        -Force | Out-Null

    Write-Host "  Advertising ID desactivado."

    Write-Host ""
    Write-Host "Telemetría configurable reducida."
    Write-Host ""
    Write-Host "NOTA:"
    Write-Host "Windows puede seguir enviando ciertos datos necesarios"
    Write-Host "para seguridad, actualizaciones y funcionamiento."
}
```
