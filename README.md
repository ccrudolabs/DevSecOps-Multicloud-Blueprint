# DevSecOps Multicloud Blueprint

Blueprint tecnico y visual para disenar, validar y documentar una arquitectura DevSecOps multicloud con foco en seguridad, cumplimiento, CI/CD, FinOps, control de cambios y gobierno operativo.

Este repositorio funciona como laboratorio enterprise para AWS, Azure y GCP. La rama `develop` conserva el trabajo de evolucion tecnica, bootstrap, diagramas, scripts FinOps y validaciones antes de promover cambios a `qa` y `main`.

## Tabla de contenidos

- [Arquitectura general](#arquitectura-general)
- [Diagramas visuales](#diagramas-visuales)
- [Entornos: develop, qa, main](#entornos-develop-qa-main)
- [Seguridad DevSecOps](#seguridad-devsecops)
- [CI/CD GitHub Actions](#cicd-github-actions)
- [Infraestructura como codigo](#infraestructura-como-codigo)
- [FinOps y reportes](#finops-y-reportes)
- [Documentacion extendida](#documentacion-extendida)
- [Como empezar](#como-empezar)
- [Gobierno del repositorio](#gobierno-del-repositorio)

## Arquitectura general

Este blueprint cubre una arquitectura multicloud para entornos criticos:

- AWS: VPC, IAM, EC2, Cost Explorer.
- Azure: VNet, App Service, Key Vault, Monitor.
- GCP: VPC, IAM, Compute, Billing via BigQuery.
- CI/CD centralizado con GitHub Actions.
- Seguridad integrada con controles de codigo, infraestructura, contenedores y secretos.

## Diagramas visuales

![DevSecOps Layout](docs/layout-multicloud-devsecops.png)

![CI/CD Multicloud](docs/layout-multicloud-ci-cd.png)

![Arquitectura Multicloud](docs/architecture-multicloud.png)

## Entornos: develop, qa, main

El repositorio esta preparado para separar entornos mediante ramas protegidas:

| Rama | Proposito | Criterio recomendado |
| --- | --- | --- |
| `develop` | Integracion tecnica y evolucion del blueprint | PR obligatorio, checks activos, sin force push |
| `qa` | Validacion previa a main | PR obligatorio, checks estrictos, trazabilidad |
| `main` | Version estable y portfolio publico | PR obligatorio, checks estrictos, conversaciones resueltas |

## Seguridad DevSecOps

- Code scanning y revision de codigo.
- Infra scanning con herramientas como tfsec o Checkov cuando aplique.
- Container scanning con Trivy cuando existan imagenes o Dockerfiles.
- Secret management con Key Vault, Secret Manager o mecanismos equivalentes.
- GitHub Advanced Security si esta habilitado.
- Politicas de ramas, pull requests y trazabilidad.

## CI/CD GitHub Actions

Ejecutores automatizados por entorno y nube:

- Workflows en `.github/workflows/`.
- Validacion Terraform condicional por cambios `.tf`.
- Evita `terraform plan` desde la raiz cuando el repositorio contiene multiples modulos o ejemplos.
- Checks obligatorios alineados a workflows reales.
- Aprobaciones y Code Owners solo cuando exista equipo/revisor valido.

## Infraestructura como codigo

Directorio `iac/` con:

- `aws/` - Terraform: VPC, IAM, instancias.
- `azure/` - Terraform: VNet, RBAC.
- `gcp/` - Terraform: red, IAM.
- `scripts/` - PowerShell: costos multicloud.

## FinOps y reportes

Scripts disponibles en `/scripts/`:

```powershell
pwsh ./scripts/get-costs-aws.ps1
pwsh ./scripts/get-costs-azure.ps1
pwsh ./scripts/get-costs-gcp.ps1
```

Dashboards recomendados: Azure Cost Management, AWS Budgets, Looker Studio.

## Documentacion extendida

- [`docs/blueprint-extension.md`](docs/blueprint-extension.md)
- [Wiki tecnica online](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki)
- [`docs/layout.md`](docs/layout.md)

La documentacion visual cubre:

- Arquitectura multicloud.
- CI/CD + seguridad.
- Layout DevSecOps.

## Como empezar

Consulta [`bootstrap/README_BOOTSTRAP.md`](bootstrap/README_BOOTSTRAP.md) para iniciar el despliegue paso a paso.

Puedes ejecutar el entorno desde cero usando:

```powershell
pwsh ./bootstrap/getting-started.ps1
```

## Gobierno del repositorio

- [Security Policy](SECURITY.md)
- [Contributing](CONTRIBUTING.md)
- [License](LICENSE)

## Autor

Carlos Crudo  
Blog: https://carloscrudo.com/  
LinkedIn: https://www.linkedin.com/in/carloscrudo/
