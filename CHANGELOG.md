# 📦 CHANGELOG – DevSecOps Multicloud Blueprint

## 🚀 Versión: feature/infra-multicloud (pendiente de merge a `develop`)

### ✨ Nuevas funcionalidades

- Infraestructura como código para:
  - AWS: `iac/aws/` (VPC, IAM, Terraform)
  - Azure: `iac/azure/` (VNet, RBAC, Terraform)
  - GCP: `iac/gcp/` (VPC, IAM, Terraform)
- Scripts de FinOps multicloud:
  - `scripts/get-costs-aws.ps1`
  - `scripts/get-costs-azure.ps1`
  - `scripts/get-costs-gcp.ps1`

### 🛡️ Seguridad DevSecOps

- Code scanning con CodeQL y Semgrep
- tfsec y Checkov integrados en workflows
- Escaneo de contenedores con Trivy
- Manejo de secretos (Vault, Secret Manager, Key Vault)
- Política de protección de ramas y .gitattributes aplicado

### 🔁 CI/CD GitHub Actions

- Workflows por proveedor:
  - `terraform.yml`
  - `aws-costs.yml`, `azure-costs.yml`, `gcp-costs.yml`
  - `codeql.yml`, `security-alerts.yml`
- Aprobaciones y validaciones automáticas

### 📊 Visualización y documentación

- Diagramas `.png` en `docs/`:
  - `architecture-multicloud.png`
  - `layout-multicloud-ci-cd.png`
  - `layout-multicloud-devsecops.png`
- Documento explicativo: `docs/layout.md`
- Documentación técnica extendida: `docs/blueprint-extension.md`

### 🧪 Bootstrap inicial

- `bootstrap/README_BOOTSTRAP.md` y `getting-started.ps1` para setup completo

### 📘 Wiki y contenido auxiliar

- Home.md actualizado con enlaces a layout y blueprint
- Preparado para integrar GitHub Pages si se requiere

---

**© Carlos Crudo 2025 – Cloud Solutions IoT®**
