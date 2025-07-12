# ╔════════════════════════════════════════════════════════════╗
# ║      CloudSolutionsIoT® – DevSecOps Repo Sync Script      ║
# ╚════════════════════════════════════════════════════════════╝

$repoUrl = "https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint.git"
$targetDir = "D:\DevSecOps-FULL"

# 1. Clonar si no existe
if (-Not (Test-Path $targetDir)) {
    git clone $repoUrl $targetDir
}

Set-Location $targetDir

# 2. Obtener todas las ramas remotas y cambiar a fix/docs-sync
git fetch --all
git checkout fix/docs-sync
git pull origin fix/docs-sync

# 3. Mostrar estado y ramas
Write-Host "`n✔️ Ramas disponibles:" -ForegroundColor Cyan
git branch -a

Write-Host "`n✔️ Archivos clave:" -ForegroundColor Cyan
$archivos = @(
    "README.md",
    "docs/desarrollo/copilot-integracion-multicloud.md",
    "docs/diagramas/layout-copilot-devsecops.png"
)

foreach ($file in $archivos) {
    if (Test-Path $file) {
        Write-Host "✅ Existe: $file" -ForegroundColor Green
    } else {
        Write-Host "❌ Falta: $file" -ForegroundColor Red
    }
}

# 4. Mostrar estado del repositorio
Write-Host "`n✔️ Estado del repositorio:" -ForegroundColor Cyan
git status

# 5. Crear Pull Request con gh CLI si está instalada
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "`n🚀 Generando Pull Request con gh CLI..." -ForegroundColor Cyan
    gh pr create --base main --head fix/docs-sync --title "🔁 Merge: Integración Copilot Multicloud" --body "Este PR incluye documentación técnica, diagramas y workflows CI/CD para la estrategia Copilot DevSecOps Multicloud. Autor: Carlos Crudo – CloudSolutionsIoT®"
} else {
    Write-Host "`n⚠️ La CLI de GitHub (gh) no está instalada. Instálala desde https://cli.github.com/ para crear PR automáticamente." -ForegroundColor Yellow
}