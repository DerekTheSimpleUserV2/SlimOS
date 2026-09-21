# SlimOS v0.1
# Windows 11 debloat / configuration tool

$ErrorActionPreference = "Stop"

Clear-Host

Write-Host "============================="
Write-Host "          SlimOS v0.1"
Write-Host "============================="
Write-Host ""

# Comprobar administrador
$principal = New-Object Security.Principal.WindowsPrincipal(
    [Security.Principal.WindowsIdentity]::GetCurrent()
)

if (-not $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)) {
    Write-Host "SlimOS necesita ejecutarse como Administrador."
    Write-Host "Haz clic derecho sobre PowerShell y selecciona:"
    Write-Host "'Ejecutar como administrador'."
    Pause
    exit
}

# Comprobar Windows
$windows = Get-CimInstance Win32_OperatingSystem

Write-Host "Sistema detectado:"
Write-Host " $($windows.Caption)"
Write-Host ""

if ($windows.Caption -notmatch "Windows 11") {
    Write-Host "SlimOS está diseñado para Windows 11."
    Pause
    exit
}

# Crear punto de restauración
Write-Host "Creando punto de restauración..."

try {
    Enable-ComputerRestore -Drive "$($env:SystemDrive)\"
    Checkpoint-Computer `
        -Description "SlimOS - Antes de modificaciones" `
        -RestorePointType "MODIFY_SETTINGS"

    Write-Host "Punto de restauración creado."
}
catch {
    Write-Host "No se pudo crear el punto de restauración."
    Write-Host "Continuando..."
}

Write-Host ""
Write-Host "============================="
Write-Host "           MENÚ"
Write-Host "============================="
Write-Host ""
Write-Host "[1] Limpiar Windows"
Write-Host "[2] Reducir telemetría"
Write-Host "[3] Optimizar servicios"
Write-Host "[4] Instalar LibreWolf"
Write-Host "[5] Instalar Avast"
Write-Host "[6] Configuración completa"
Write-Host "[7] Salir"
Write-Host ""

$choice = Read-Host "Selecciona una opción"

switch ($choice) {

    "1" {
        . "$PSScriptRoot\modules\cleanup.ps1"
        Start-SlimOSCleanup
    }

    "2" {
        . "$PSScriptRoot\modules\telemetry.ps1"
        Start-SlimOSTelemetry
    }

    "3" {
        . "$PSScriptRoot\modules\services.ps1"
        Start-SlimOSServices
    }

    "4" {
        . "$PSScriptRoot\modules\installers.ps1"
        Install-LibreWolf
    }

    "5" {
        . "$PSScriptRoot\modules\installers.ps1"
        Install-Avast
    }

    "6" {
        Write-Host ""
        Write-Host "La configuración completa todavía está en desarrollo."
        Write-Host "SlimOS no realizará cambios destructivos automáticamente."
    }

    "7" {
        exit
    }

    default {
        Write-Host "Opción no válida."
    }
}

Write-Host ""
Pause
