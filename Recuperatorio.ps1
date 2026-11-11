$ipDestino = "8.8.8.8"

for ($i = 1; $i -le 3; $i++) {
    
    $fechaHora = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
    
    $respuesta = Test-Connection -ComputerName $ipDestino -Count 1 -Quiet
    
    if ($i % 2 -eq 0) {
        Write-Host "[$fechaHora] Iteración par ($i): Realizando verificación de conexion" -ForegroundColor Cyan
    } else {
        Write-Host "[$fechaHora] Iteración impar ($i): Verificando estado " -ForegroundColor Yellow
    }
    
    if ($respuesta) {
        Write-Host "   -> Resultado: Conexión lograda a $ipDestino" -ForegroundColor Green
    } else {
        Write-Host "   -> Resultado: Sin respuesta de $ipDestino" -ForegroundColor Red
    }
    
    Write-Host "--------------------------------------------------"
    Start-Sleep -Seconds 1
}

Write-Host "El monitoreo de red ha concluido con éxito." -ForegroundColor BrightWhite