```powershell
function Test-AvastInstalled {

    $AvastPaths = @(
        "$env:ProgramFiles\Avast Software",
        "${env:ProgramFiles(x86)}\Avast Software"
    )

    foreach ($Path in $AvastPaths) {
        if ($Path -and (Test-Path $Path)) {
            return $true
        }
    }

    return $false
}


function Get-ActiveAntivirus {

    try {
        $Products = Get-CimInstance `
            -Namespace "root/SecurityCenter2" `
            -ClassName AntiVirusProduct `
            -ErrorAction Stop

        return $Products
    }
    catch {
        return @()
    }
}


function Start-SlimOSSecurity {

    Write-Host ""
    Write-Host "============================="
    Write-Host "       SlimOS Security"
    Write-Host "============================="
    Write-Host ""

    Write-Host "Comprobando antivirus..."
    Write-Host ""

    $Antivirus = Get-ActiveAntivirus

    if (-not $Antivirus -or $Antivirus.Count -eq 0) {

        Write-Host "NO se detectó un antivirus registrado."
        Write-Host ""
        Write-Host "SlimOS no realizará cambios de seguridad."
        Write-Host "Instala y activa Avast antes de continuar."

        return
    }

    Write-Host "Antivirus detectados:"
    Write-Host ""

    foreach ($AV in $Antivirus) {
        Write-Host " - $($AV.displayName)"
    }

    Write-Host ""

    $Avast = $Antivirus |
        Where-Object {
            $_.displayName -match "Avast"
        }

    if (-not $Avast) {

        Write-Host "Avast no aparece como antivirus activo."
        Write-Host ""
        Write-Host "SlimOS no modificará la protección de Windows."

        return
    }

    Write-Host "Avast detectado correctamente."
    Write-Host ""
    Write-Host "Protección alternativa disponible."
    Write-Host ""
    Write-Host "SlimOS no desactivará completamente Microsoft Defender"
    Write-Host "mediante este módulo."
    Write-Host ""
    Write-Host "La configuración de seguridad se mantiene intacta."
}
```
