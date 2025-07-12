# ╔════════════════════════════════════════════════════════════╗
# ║    CloudSolutionsIoT – Admin de Ramas DevSecOps GitHub    ║
# ╚════════════════════════════════════════════════════════════╝

$repoPath = "D:\DevSecOps-FULL"
Set-Location $repoPath
$logPath = "$repoPath\admin-rama-log.txt"
Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Inicio de sesión del asistente.')

function Mostrar-Menu {
    Clear-Host
    Write-Host "CloudSolutionsIoT – Administrador de Ramas DevSecOps" -ForegroundColor Cyan
    Write-Host "------------------------------------------------------"
    Write-Host "[1] Comparar ramas con main/develop/qa"
    Write-Host "[2] Backup y archivar ramas"
    Write-Host "[3] Eliminar rama remota (con confirmación)"
    Write-Host "[4] Crear Pull Request automático (gh CLI)"
    Write-Host "[5] Ver log"
    Write-Host "[6] Salir"
}

function Comparar-Ramas {
    $branchesToCompare = @("patch/readme-badge-version", "fix/remove-vsdx")
    $compareAgainst = Read-Host "¿Con qué rama querés comparar? (main/develop/qa)"
    foreach ($branch in $branchesToCompare) {
        Write-Host "`n🔍 Comparando $branch con $compareAgainst..."
        git fetch origin $compareAgainst
        git fetch origin $branch
        $diffOutput = git diff origin/$compareAgainst...origin/$branch --stat
        if ($diffOutput) {
            Write-Host "⚠️ Diferencias encontradas"
            Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Diferencias entre ' + $branch + ' y ' + $compareAgainst + ':' + [Environment]::NewLine + $diffOutput + [Environment]::NewLine)
        } else {
            Write-Host "✅ Sin diferencias relevantes"
            Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Sin diferencias entre ' + $branch + ' y ' + $compareAgainst)
        }
    }
    Pause
}

function Backup-Archivar-Ramas {
    $branchesToBackup = @("patch/readme-badge-version", "fix/remove-vsdx")
    foreach ($branch in $branchesToBackup) {
        $safeName = $branch.Replace("/", "-")
        $zipName = "$repoPath\backup-$safeName.zip"
        $archiveBranch = "archived/$safeName"
        git checkout $branch
        Compress-Archive -Path * -DestinationPath $zipName -Force
        git checkout main
        git branch $archiveBranch origin/$branch
        git push origin $archiveBranch
        Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Respaldada y archivada: ' + $branch + ' -> ' + $archiveBranch)
        Write-Host "✅ $branch archivada como $archiveBranch y respaldada en $zipName"
    }
    Pause
}

function Eliminar-Rama {
    $branchesToDelete = @("patch/readme-badge-version", "fix/remove-vsdx")
    foreach ($branch in $branchesToDelete) {
        $respuesta = Read-Host "¿Eliminar remotamente la rama $branch? (s/n)"
        if ($respuesta -eq 's') {
            git push origin --delete $branch
            Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama eliminada: ' + $branch)
            Write-Host "❌ Rama $branch eliminada." -ForegroundColor Yellow
        } else {
            Write-Host "⏭️ Saltando $branch" -ForegroundColor Gray
        }
    }
    Pause
}

function Crear-PR {
    $fromBranch = Read-Host "Desde qué rama querés crear el PR"
    $toBranch = Read-Host "Hacia qué rama (ej: main)"
    $title = Read-Host "Título del PR"
    $body = Read-Host "Descripción del PR"
    if (Get-Command gh -ErrorAction SilentlyContinue) {
        gh pr create --base $toBranch --head $fromBranch --title $title --body $body
        Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] PR creado: ' + $fromBranch + ' -> ' + $toBranch)
        Write-Host "🚀 PR creado con éxito." -ForegroundColor Green
    } else {
        Write-Host "⚠️ CLI gh no está instalada. Instalar desde https://cli.github.com/" -ForegroundColor Red
    }
    Pause
}

function Ver-Log {
    notepad $logPath
}

do {
    Mostrar-Menu
    $opcion = Read-Host "Seleccioná una opción"
    switch ($opcion) {
        "1" { Comparar-Ramas }
        "2" { Backup-Archivar-Ramas }
        "3" { Eliminar-Rama }
        "4" { Crear-PR }
        "5" { Ver-Log }
        "6" { exit }
        default { Write-Host "❌ Opción inválida"; Pause }
    }
} while ($true)