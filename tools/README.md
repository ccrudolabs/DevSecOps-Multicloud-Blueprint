# 🧰 Herramientas de Administración de Ramas – DevSecOps-Multicloud

Esta carpeta contiene scripts PowerShell diseñados para automatizar tareas comunes de gestión de ramas en el repositorio `DevSecOps-Multicloud-Blueprint`.

---

## 📂 Scripts incluidos

| Script | Descripción |
|--------|-------------|
| `admin-rama-devsecops.ps1` | Asistente interactivo que centraliza todas las funciones clave de administración de ramas |
| `archivar-y-eliminar-ramas.ps1` | Script para archivar, respaldar y eliminar ramas individuales con confirmación |
| `comparar-contenido-rama-main.ps1` | Comparador técnico de diferencias entre ramas (`main`, `develop`, `qa`) |
| `deploy-to-main-pr.ps1` | Despliegue mediante Pull Request desde rama secundaria a `main` |
| `rollback-auto-pr.ps1` | Rollback automático a un commit o tag + creación de PR |
| `rollback-by-commit-or-tag.ps1` | Rollback seguro sin PR automático (solo rama y backup) |
| `sync-and-pr-fix-docs-sync.ps1` | Sincronización completa de la rama `fix/docs-sync` con validación y creación de PR |

---

## ✅ Requisitos

- Git instalado y autenticado
- GitHub CLI (`gh`) configurado: `gh auth login`
- PowerShell 5.1+ o superior
- Permisos sobre el repositorio remoto para crear ramas y PR

---

## 🧾 Recomendación de uso

Ubicá estos scripts en tu máquina local o dentro del repositorio en la carpeta `/tools`.  
Ejecutalos en el entorno `D:\DevSecOps-FULL` o donde tengas el repo clonado.

✍️ Autor: Carlos Crudo – CloudSolutionsIoT® 2025