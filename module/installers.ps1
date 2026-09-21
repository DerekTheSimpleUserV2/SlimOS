```powershell
function Install-LibreWolf {
    Write-Host ""
    Write-Host "============================="
    Write-Host "       Instalando LibreWolf"
    Write-Host "============================="
    Write-Host ""

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "ERROR: winget no está disponible."
        return
    }

    Write-Host "Buscando LibreWolf..."

    winget install --id LibreWolf.LibreWolf `
        --exact `
        --source winget `
        --accept-source-agreements `
        --accept-package-agreements

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "LibreWolf se instaló correctamente."
    }
    else {
        Write-Host ""
        Write-Host "No se pudo instalar LibreWolf."
    }
}


function Install-Avast {
    Write-Host ""
    Write-Host "============================="
    Write-Host "         Instalando Avast"
    Write-Host "============================="
    Write-Host ""

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "ERROR: winget no está disponible."
        return
    }

    Write-Host "Buscando Avast..."

    winget install --id Avast.Antivirus `
        --exact `
        --source winget `
        --accept-source-agreements `
        --accept-package-agreements

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Avast se instaló correctamente."
    }
    else {
        Write-Host ""
        Write-Host "No se pudo instalar Avast."
    }
}
```
