```powershell
function Start-SlimOSServices {

    Write-Host ""
    Write-Host "============================="
    Write-Host "       SlimOS Services"
    Write-Host "============================="
    Write-Host ""

    # Servicios opcionales que pueden desactivarse
    $OptionalServices = @(
        "MapsBroker",       # Downloaded Maps Manager
        "Fax",              # Fax
        "RetailDemo",       # Retail Demo
        "WerSvc"            # Windows Error Reporting
    )

    foreach ($ServiceName in $OptionalServices) {

        $Service = Get-Service `
            -Name $ServiceName `
            -ErrorAction SilentlyContinue

        if ($Service) {

            Write-Host "Procesando: $ServiceName"

            try {

                if ($Service.Status -eq "Running") {
                    Stop-Service `
                        -Name $ServiceName `
                        -Force `
                        -ErrorAction SilentlyContinue
                }

                Set-Service `
                    -Name $ServiceName `
                    -StartupType Disabled `
                    -ErrorAction Stop

                Write-Host "  Servicio desactivado."
            }
            catch {
                Write-Host "  No se pudo modificar."
            }
        }
        else {
            Write-Host "No encontrado: $ServiceName"
        }
    }

    Write-Host ""
    Write-Host "SlimOS terminó de optimizar los servicios."
    Write-Host ""
    Write-Host "No se modificaron servicios críticos de Windows."
}
```
