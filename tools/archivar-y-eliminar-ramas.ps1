# CloudSolutionsIoT – Script seguro de archivado y eliminación de ramas
$repoPath = "D:\DevSecOps-FULL"
$logPath = "$repoPath\backup-delete-log.txt"
Set-Location $repoPath
Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Inicio del proceso de respaldo y borrado de ramas.')

Write-Host '🔄 Procesando rama: patch/readme-badge-version' -ForegroundColor Cyan
git fetch origin patch/readme-badge-version
git checkout patch/readme-badge-version
Compress-Archive -Path * -DestinationPath "$repoPath\backup-patch-readme-badge-version.zip" -Force
git checkout main
git branch archived/patch-readme-badge-version origin/patch/readme-badge-version
git push origin archived/patch-readme-badge-version
Write-Host '✅ Rama archivada como: archived/patch-readme-badge-version' -ForegroundColor Green
Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama patch/readme-badge-version archivada como archived/patch-readme-badge-version, respaldo en backup-patch-readme-badge-version.zip')

# Confirmar si se desea borrar
$respuesta = Read-Host '¿Deseás eliminar la rama remota patch/readme-badge-version? (s/n)'
if ($respuesta -eq 's') {
    git push origin --delete patch/readme-badge-version
    Write-Host '❌ Rama eliminada remotamente: patch/readme-badge-version' -ForegroundColor Yellow
    Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama eliminada: patch/readme-badge-version')
} else {
    Write-Host '⏭️ Rama NO eliminada: patch/readme-badge-version' -ForegroundColor Magenta
    Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama no eliminada por decisión del usuario: patch/readme-badge-version')
}

Write-Host '🔄 Procesando rama: fix/remove-vsdx' -ForegroundColor Cyan
git fetch origin fix/remove-vsdx
git checkout fix/remove-vsdx
Compress-Archive -Path * -DestinationPath "$repoPath\backup-fix-remove-vsdx.zip" -Force
git checkout main
git branch archived/fix-remove-vsdx origin/fix/remove-vsdx
git push origin archived/fix-remove-vsdx
Write-Host '✅ Rama archivada como: archived/fix-remove-vsdx' -ForegroundColor Green
Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama fix/remove-vsdx archivada como archived/fix-remove-vsdx, respaldo en backup-fix-remove-vsdx.zip')

# Confirmar si se desea borrar
$respuesta = Read-Host '¿Deseás eliminar la rama remota fix/remove-vsdx? (s/n)'
if ($respuesta -eq 's') {
    git push origin --delete fix/remove-vsdx
    Write-Host '❌ Rama eliminada remotamente: fix/remove-vsdx' -ForegroundColor Yellow
    Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama eliminada: fix/remove-vsdx')
} else {
    Write-Host '⏭️ Rama NO eliminada: fix/remove-vsdx' -ForegroundColor Magenta
    Add-Content -Path $logPath -Value ('[' + (Get-Date) + '] Rama no eliminada por decisión del usuario: fix/remove-vsdx')
}
