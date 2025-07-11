# Infraestructura Azure

Este módulo contiene definiciones de infraestructura para Microsoft Azure utilizando Terraform.

## Contenido

- `main.tf`: Configura el proveedor `azurerm` y módulo de red.
- `vnet.tf`: Define una red virtual básica.
- `rbac.tf`: Aplica una asignación de rol RBAC a la VNet.

## Uso

```bash
cd iac/azure
terraform init
terraform plan
terraform apply
```
