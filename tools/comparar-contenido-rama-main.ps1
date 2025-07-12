# CloudSolutionsIoT – Comparador de ramas previo a eliminación segura
# Compara cada rama objetivo con 'main' y registra diferencias en un log

$repoPath = "D:\DevSecOps-FULL"
$logPath = "$repoPath\branch-compare-log.txt"
Set-Location $repoPath

$mainBranch = "main"
$branchesToCompare = @(
    "patch/readme-badge-version",
    "fix/remove-vsdx"
)

Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Inicio de comparación entre ramas y ' + $mainBranch + '.') 

foreach ($branch in $branchesToCompare) {
    Write-Host "`n🔍 Comparando $branch con $mainBranch..." -ForegroundColor Cyan
    git fetch origin $branch
    git fetch origin $mainBranch

    git checkout $mainBranch
    git pull origin $mainBranch

    git checkout $branch
    git pull origin $branch

    $diffOutput = git diff origin/$mainBranch...origin/$branch --stat

    if ($diffOutput) {
        Write-Host "⚠️ Diferencias encontradas entre $branch y $mainBranch" -ForegroundColor Yellow
        Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Diferencias entre ' + $branch + ' y ' + $mainBranch + ':' + [Environment]::NewLine + $diffOutput + [Environment]::NewLine)
    } else {
        Write-Host "✅ Sin diferencias relevantes: $branch es idéntica a $mainBranch" -ForegroundColor Green
        Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Sin diferencias entre ' + $branch + ' y ' + $mainBranch)
    }
}

Write-Host "`n📄 Comparación finalizada. Revisión completa registrada en $logPath" -ForegroundColor Cyan