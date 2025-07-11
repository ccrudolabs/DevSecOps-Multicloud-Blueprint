# 📊 Diagramas de Arquitectura – DevSecOps Multicloud

Este documento explica los diagramas visuales que componen la arquitectura técnica del proyecto **DevSecOps-Multicloud-Blueprint**.

---

## 🧭 1. Arquitectura Multicloud General

![Arquitectura Multicloud](architecture-multicloud.png)

Este diagrama representa la distribución general de recursos en AWS, Azure y GCP, incluyendo:

- Redes virtuales (VPC/VNet)
- Identidad y control de acceso (IAM, RBAC)
- Almacenamiento por nube
- Elementos comunes como CI/CD, control de costos y monitoreo

---

## 🔁 2. Layout CI/CD + Seguridad Multicloud

![CI/CD + Seguridad](layout-multicloud-ci-cd.png)

Representa el flujo CI/CD completo:

- GitHub Actions como orquestador
- Validaciones de seguridad (`tfsec`, `CodeQL`, `Trivy`)
- Flujos desde `develop` → `qa` → `main`
- Artefactos y despliegue por proveedor

---

## 🛡️ 3. Layout DevSecOps Integrado

![Layout DevSecOps](layout-multicloud-devsecops.png)

Muestra las buenas prácticas DevSecOps integradas:

- Integración con SonarQube y escaneos Semgrep
- Seguridad en código, contenedores y secretos
- FinOps a través de scripts PowerShell + dashboards
- Aislamiento por entorno (`dev`, `qa`, `prd`)

---

## 🧠 Recomendaciones

Estos diagramas deben actualizarse si:

- Se agrega un nuevo proveedor cloud
- Cambia el flujo CI/CD
- Se implementan nuevos controles de seguridad

---

**© Carlos Crudo 2025 – Cloud Solutions IoT®**
