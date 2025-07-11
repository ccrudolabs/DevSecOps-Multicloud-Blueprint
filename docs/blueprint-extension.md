# Documentación Extendida – Infraestructura y Scripts

Este documento detalla la infraestructura definida en Terraform para AWS y Azure, así como los scripts PowerShell utilizados para consultar costos multicloud.

---

## 🌐 AWS – `iac/aws/`

Este módulo contiene definiciones de infraestructura para AWS utilizando Terraform.

### Archivos incluidos:

- `main.tf`: Configura el proveedor AWS y módulo base de red.
- `vpc.tf`: Define una VPC con bloque CIDR.
- `iam.tf`: Crea un rol IAM para acceso EC2.

### Uso recomendado:

```bash
cd iac/aws
terraform init
terraform plan
terraform apply
```

---

## ☁️ Azure – `iac/azure/`

Este módulo contiene definiciones de infraestructura para Microsoft Azure utilizando Terraform.

### Archivos incluidos:

- `main.tf`: Configura el proveedor `azurerm` y módulo de red.
- `vnet.tf`: Define una red virtual básica.
- `rbac.tf`: Aplica una asignación de rol RBAC a la VNet.

### Uso recomendado:

```bash
cd iac/azure
terraform init
terraform plan
terraform apply
```

---

## 📊 Scripts PowerShell – `scripts/`

Scripts para consultar el uso y costos de cada proveedor cloud:

### Archivos incluidos:

- `get-costs-aws.ps1`: Consulta AWS Cost Explorer.
- `get-costs-azure.ps1`: Consulta Azure Cost Management.
- `get-costs-gcp.ps1`: Para BigQuery con exportación de billing.

### Ejecución:

```powershell
pwsh ./scripts/get-costs-aws.ps1
pwsh ./scripts/get-costs-azure.ps1
pwsh ./scripts/get-costs-gcp.ps1
```

---
