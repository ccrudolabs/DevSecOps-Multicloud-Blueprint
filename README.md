# DevSecOps Multicloud Blueprint 🚀

Repositorio técnico y visual profesional para desplegar una arquitectura DevSecOps multicloud enfocada en entornos Fintech.  
Incluye controles de seguridad, cumplimiento, CI/CD seguro, scripts FinOps y documentación avanzada para AWS, Azure y GCP.

---

## 📚 Tabla de Contenidos

- [📐 Arquitectura General](#-arquitectura-general)
- [📊 Diagramas Visuales](#-diagramas-visuales)
- [🧩 Entornos: Dev, QA, Prod](#-entornos-dev-qa-prod)
- [🔐 Seguridad DevSecOps](#-seguridad-devsecops)
- [🛠️ CI/CD GitHub Actions](#️-cicd-github-actions)
- [📦 Infraestructura como Código](#-infraestructura-como-código)
- [📈 FinOps y Reportes](#-finops-y-reportes)
- [📁 Documentación Extendida](#-documentación-extendida)

---

## 📐 Arquitectura General

Este blueprint cubre una arquitectura multicloud para entornos críticos:

- AWS: VPC, IAM, EC2, Cost Explorer
- Azure: VNet, App Service, Key Vault, Monitor
- GCP: VPC, IAM, Compute, Billing via BigQuery
- CI/CD centralizado con GitHub Actions
- Seguridad integrada (CodeQL, tfsec, Trivy)

---

## 📊 Diagramas Visuales

![DevSecOps Layout](docs/layout-multicloud-devsecops.png)

![CI/CD Multicloud](docs/layout-multicloud-ci-cd.png)

![Arquitectura Multicloud](docs/architecture-multicloud.png)

---

## 🧩 Entornos: Dev, QA, Prod

El repositorio está preparado para separar entornos mediante:

- Módulos independientes por ambiente
- Variables `terraform.tfvars`
- Branches protegidas: `develop`, `qa`, `main`

---

## 🔐 Seguridad DevSecOps

- Code Scanning: CodeQL, Semgrep
- Infra Scanning: tfsec, Checkov
- Container Scanning: Trivy
- Secrets controlados con Key Vault / Secret Manager
- GitHub Advanced Security (si está habilitado)

---

## 🛠️ CI/CD GitHub Actions

Ejecutores automatizados por entorno y nube:

- Workflows en `.github/workflows/`
- Despliegue modular (`terraform init/plan/apply`)
- Validaciones de seguridad embebidas
- Aprobaciones mínimas requeridas

---

## 📦 Infraestructura como Código

Directorio `iac/` con:

- `aws/` – Terraform: VPC, IAM, instancias
- `azure/` – Terraform: VNet, RBAC
- `gcp/` – Terraform: red, IAM
- `scripts/` – PowerShell: costos multicloud

---

## 📈 FinOps y Reportes

Scripts disponibles en `/scripts/`:

```powershell
pwsh ./scripts/get-costs-aws.ps1
pwsh ./scripts/get-costs-azure.ps1
pwsh ./scripts/get-costs-gcp.ps1
```

Dashboards recomendados: Azure Cost Management, AWS Budgets, Looker Studio

---

## 📁 Documentación Extendida

Consulta más en:

👉 [`docs/blueprint-extension.md`](docs/blueprint-extension.md)

👉 [Wiki Técnica Online](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki)

---

**© Carlos Crudo 2025 – Cloud Solutions IoT®**
