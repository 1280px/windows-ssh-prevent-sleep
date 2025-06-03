$interval = 15
$standbyTimeout = 10

while ($true) {
    $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Count active SSH connections;
    # @ to always return a number, 2>$null to supress error when no connections found
    $activeSSH = @(Get-NetTCPConnection -State Established -LocalPort 22 2>$null).Count

    if ($activeSSH -gt 0) {
        Write-Host "$now :: Active SSH connection detected ($activeSSH), preventing sleep!" -ForegroundColor Yellow
        Powercfg.exe /Change standby-timeout-ac 0
    } else {
        Write-Host "$now :: No active SSH connections, resetting to standard sleep timeout." -ForegroundColor Green
        Powercfg.exe /Change standby-timeout-ac $standbyTimeout
    }

    Start-Sleep -Seconds $interval
}
