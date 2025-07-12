# ╔════════════════════════════════════════════════════════════╗
# ║     CloudSolutionsIoT® – Rollback por Commit o Tag        ║
# ╚════════════════════════════════════════════════════════════╝

param(
    [string]$targetRef = "",
    [string]$rollbackBranch = "rollback-temp",
    [string]$baseBranch = "main"
)

$repoPath = "D:\DevSecOps-FULL"
Set-Location $repoPath

# Verificar que se indique un commit o tag válido
if ([string]::IsNullOrWhiteSpace($targetRef)) {
    Write-Host "❌ Debes proporcionar un commit SHA o nombre de tag para hacer rollback." -ForegroundColor Red
    exit 1
}

# Obtener último estado de main y crear nueva rama temporal de rollback
git fetch origin
git checkout $baseBranch
git pull origin $baseBranch

# Crear rama temporal para el rollback
git checkout -b $rollbackBranch $targetRef

# Push de rama rollback para PR manual
git push origin $rollbackBranch

Write-Host "`n✅ Rama '$rollbackBranch' creada desde '$targetRef'. Ahora podés crear un Pull Request desde esta rama hacia 'main' para aplicar el rollback." -ForegroundColor Green