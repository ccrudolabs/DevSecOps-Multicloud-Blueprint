# ╔════════════════════════════════════════════════════════════╗
# ║   CloudSolutionsIoT® – Script de Despliegue por Pull PR   ║
# ╚════════════════════════════════════════════════════════════╝

param(
    [string]$fromBranch = "fix/docs-sync",
    [string]$toBranch = "main",
    [string]$prTitle = "🚀 Despliegue de contenido aprobado hacia main",
    [string]$prBody = "Este PR despliega contenido técnico aprobado desde `$fromBranch` hacia producción (`main`)."
)

$repoPath = "D:\DevSecOps-FULL"
Set-Location $repoPath

# Validar CLI de GitHub
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "`n⚠️ La CLI de GitHub no está instalada. Instálala desde https://cli.github.com para continuar." -ForegroundColor Yellow
    exit 1
}

# Verificar ramas remotas y locales
git fetch --all
git checkout $fromBranch
git pull origin $fromBranch

# Crear el Pull Request
Write-Host "`n🚀 Creando Pull Request de $fromBranch → $toBranch ..." -ForegroundColor Cyan
gh pr create --base $toBranch --head $fromBranch --title $prTitle --body $prBody