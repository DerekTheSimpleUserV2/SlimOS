```powershell
function Start-SlimOSCleanup {

    Write-Host ""
    Write-Host "============================="
    Write-Host "        SlimOS Cleanup"
    Write-Host "============================="
    Write-Host ""

    Write-Host "Buscando aplicaciones preinstaladas..."
    Write-Host ""

    # Aplicaciones que SlimOS puede eliminar
    $AppsToRemove = @(
        "Microsoft.BingNews",
        "Microsoft.BingWeather",
        "Microsoft.GetHelp",
        "Microsoft.Getstarted",
        "Microsoft.MicrosoftOfficeHub",
        "Microsoft.MicrosoftSolitaireCollection",
        "Microsoft.People",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.WindowsMaps",
        "Microsoft.Xbox.TCUI",
        "Microsoft.XboxGamingOverlay",
        "Microsoft.XboxGameOverlay",
        "Microsoft.XboxIdentityProvider",
        "Microsoft.XboxSpeechToTextOverlay"
    )

    foreach ($App in $AppsToRemove) {

        $Package = Get-AppxPackage -AllUsers -Name $App `
            -ErrorAction SilentlyContinue

        if ($Package) {

            Write-Host "Eliminando: $App"

            try {
                Remove-AppxPackage `
                    -Package $Package.PackageFullName `
                    -AllUsers `
                    -ErrorAction Stop

                Write-Host "  OK"
            }
            catch {
                Write-Host "  No se pudo eliminar."
            }
        }
        else {
            Write-Host "No encontrado: $App"
        }
    }

    Write-Host ""
    Write-Host "Limpiando archivos temporales..."

    try {
        Get-ChildItem "$env:TEMP\*" `
            -Force `
            -ErrorAction SilentlyContinue |
            Remove-Item `
                -Recurse `
                -Force `
                -ErrorAction SilentlyContinue

        Write-Host "Archivos temporales limpiados."
    }
    catch {
        Write-Host "No se pudieron limpiar algunos archivos."
    }

    Write-Host ""
    Write-Host "SlimOS Cleanup terminó."
}
```
