# Infraestructura AWS

Este módulo contiene definiciones de infraestructura para AWS utilizando Terraform.

## Contenido

- `main.tf`: Configura el proveedor AWS y módulo base de red.
- `vpc.tf`: Define una VPC con bloque CIDR.
- `iam.tf`: Crea un rol IAM para acceso EC2.

## Uso

```bash
cd iac/aws
terraform init
terraform plan
terraform apply
```
