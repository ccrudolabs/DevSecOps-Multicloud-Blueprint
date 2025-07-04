# 🚀 DevSecOps Multicloud Blueprint

[![Terraform](https://img.shields.io/badge/IaC-Terraform-blueviolet)](https://www.terraform.io/)
[![CI/CD](https://img.shields.io/badge/GitHub-Actions-blue)](https://github.com/features/actions)
[![Cloud](https://img.shields.io/badge/Cloud-Azure%20%7C%20AWS-green)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Blueprint profesional para la implementación de entornos **DevSecOps multicloud** en Azure y AWS, utilizando Terraform, GitHub Actions, seguridad automatizada, trazabilidad, gobernanza y FinOps.

---

## 📚 Tabla de contenidos

- [🌐 Visión General](#-visión-general)
- [📐 Arquitectura Técnica](#-arquitectura-técnica)
- [🔐 Seguridad DevSecOps](#-seguridad-devsecops)
- [⚙️ CI/CD Seguro](#️-cicd-seguro)
- [🧠 Gobernanza y FinOps](#-gobernanza-y-finops)
- [📦 Infraestructura como Código](#-infraestructura-como-código)
- [📝 Documentación Wiki](#-documentación-wiki)
- [🛠️ Requisitos y Uso](#️-requisitos-y-uso)
- [📄 Licencia](#-licencia)

---

## 🌐 Visión General

Este proyecto proporciona una base completa para diseñar, desplegar y gobernar entornos multicloud con prácticas DevSecOps modernas.

**Objetivos clave**:
- Seguridad desde el inicio (shift left)
- Despliegues auditables con control de cambios
- Optimización de costos (FinOps)
- Cumplimiento de políticas y trazabilidad

---

## 📐 Arquitectura Técnica

![Topología](docs/Topologia_DevSecOps_Azure.png)

Componentes principales:
- Azure / AWS (Red, App, API, Storage)
- Terraform IaC por ambiente
- GitHub Actions como orquestador CI/CD
- Monitoreo + alertas (Sentinel, GuardDuty)
- Seguridad: Defender, IAM, Key Vault, SCP

---

## 🔐 Seguridad DevSecOps

- Validación de código con `tfsec`, `tflint`, `CodeQL`
- Control de secretos con GitHub Advanced Security y Key Vault
- Revisión por `CODEOWNERS`
- Auditoría con Sentinel / CloudTrail
- RBAC + IAM segmentado

Más info 👉 [Wiki: Seguridad](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki/Seguridad-DevSecOps)

---

## ⚙️ CI/CD Seguro

Pipeline de despliegue validado y protegido:

```yaml
terraform fmt → validate → tflint → tfsec → plan
```

- Protecciones en rama `main`
- Revisión obligatoria con PR
- Aprobaciones mínimas (2)
- Workflow: `.github/workflows/terraform.yml`

Más info 👉 [Wiki: CI/CD Seguro](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki/CI-CD-Seguro)

---

## 🧠 Gobernanza y FinOps

- Azure Policy / AWS Control Tower
- Etiquetado por entorno y costo
- Seguimiento de presupuesto y optimización
- Uso de Cost Explorer y Cost Management

Más info 👉 [Wiki: Gobernanza y FinOps](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki/Gobernanza-y-FinOps)

---

## 📦 Infraestructura como Código

- Uso de Terraform modularizado
- Variables por entorno (`dev`, `qa`, `prd`)
- `terraform.tfvars.example` incluido
- Buenas prácticas de despliegue y validación

Más info 👉 [Wiki: Terraform](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki/Infraestructura-con-Terraform)

---

## 📝 Documentación Wiki

Toda la documentación técnica y operativa está disponible en la [Wiki del repositorio](https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/wiki)

---

## 🛠️ Requisitos y Uso

- Terraform >= 1.4
- Git + GitHub CLI (opcional)
- Azure CLI / AWS CLI configurados
- Permisos de despliegue y acceso a repositorio

```bash
terraform init
terraform plan
terraform apply
```

---

## 📄 Licencia

Distribuido bajo la licencia MIT. Ver [`LICENSE`](./LICENSE).