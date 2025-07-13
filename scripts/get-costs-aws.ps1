Write-Host "Obteniendo costos de AWS..."
Get-CECostAndUsage -TimePeriod_Start "2024-07-01" -TimePeriod_End "2024-07-31" -Granularity MONTHLY -Metrics "UnblendedCost"