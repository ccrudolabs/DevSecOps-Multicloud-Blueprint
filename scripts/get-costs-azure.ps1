Write-Host "Obteniendo costos de Azure..."
Get-AzConsumptionUsageDetail -StartDate "2024-07-01" -EndDate "2024-07-31"