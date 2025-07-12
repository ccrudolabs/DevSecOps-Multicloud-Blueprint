# ╔════════════════════════════════════════════════════════════╗
# ║   CloudSolutionsIoT® – Rollback Automático + PR GitHub    ║
# ╚════════════════════════════════════════════════════════════╝

param(
    [string]$targetRef = "",
    [string]$rollbackBranch = "rollback-temp",
    [string]$baseBranch = "main"
)

$repoPath = "D:\DevSecOps-FULL"
Set-Location $repoPath

# Verificar CLI de GitHub
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "`n⚠️ La CLI de GitHub (gh) no está instalada. Descargala desde https://cli.github.com/" -ForegroundColor Yellow
    exit 1
}

# Validar parámetro obligatorio
if ([string]::IsNullOrWhiteSpace($targetRef)) {
    Write-Host "❌ Debes especificar un commit SHA o tag válido con -targetRef" -ForegroundColor Red
    exit 1
}

# Sincronizar rama base y crear rama de rollback
git fetch origin
git checkout $baseBranch
git pull origin $baseBranch
git checkout -b $rollbackBranch $targetRef
git push origin $rollbackBranch

# Crear Pull Request automáticamente
Write-Host "`n🚀 Creando Pull Request automático para rollback..." -ForegroundColor Cyan
gh pr create --base $baseBranch --head $rollbackBranch --title "⚠️ Rollback a $targetRef" --body "Este PR revierte el estado del repositorio a $targetRef por razones operativas o de control de versiones. Aprobación requerida."

Write-Host "`n✅ Rollback creado y PR enviado. Revisá en GitHub." -ForegroundColor Green