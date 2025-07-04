# Bootstrap DevSecOps - Inicio de Proyecto

Esta carpeta contiene el script `getting-started.ps1` para preparar un flujo completo de desarrollo desde cero.

## ¿Qué hace el script?

- Crea las ramas `develop` y `qa` si no existen
- Realiza un cambio simulado en `develop`
- Hace commit y push del cambio a GitHub
- Te deja listo para crear un Pull Request desde `develop` hacia `main`

## ¿Cómo usarlo?

1. Guardá los archivos en la raíz de tu repositorio local
2. Abrí PowerShell
3. Ejecutá los siguientes comandos:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
cd "$env:USERPROFILE\DevSecOps-Multicloud-Blueprint"
.\getting-started.ps1
```

Luego ingresá a:

👉 https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/pulls  
y hacé clic en “Compare & pull request” para abrir un PR desde `develop`.

---

© Carlos Crudo 2025 – Cloud Solutions IoT®
