# Scripts de Costeo Multicloud

Esta carpeta contiene scripts PowerShell para consultar el uso y costos por proveedor.

## Scripts

- `get-costs-aws.ps1`: Consulta AWS Cost Explorer.
- `get-costs-azure.ps1`: Usa `Get-AzConsumptionUsageDetail`.
- `get-costs-gcp.ps1`: Genera salida para consultar BigQuery (requiere exportación de billing habilitada).

## Ejecución

Asegúrese de tener permisos y módulos instalados. Luego ejecute:

```powershell
pwsh ./get-costs-aws.ps1
pwsh ./get-costs-azure.ps1
pwsh ./get-costs-gcp.ps1
```
