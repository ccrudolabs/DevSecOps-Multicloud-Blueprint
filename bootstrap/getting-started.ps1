# getting-started.ps1
# Script inicial para crear ramas, simular cambios y preparar flujo PR DevSecOps

# Asegurarse de estar en el repositorio local
Write-Host "Navegando al repositorio..."
cd "$env:USERPROFILE\DevSecOps-Multicloud-Blueprint"

# Crear ramas si no existen y subirlas
Write-Host "Creando rama develop..."
git checkout -b develop 2>$null
git push origin develop

Write-Host "Creando rama qa..."
git checkout -b qa 2>$null
git push origin qa

# Volver a develop
git checkout develop

# Simular un cambio
Write-Host "Agregando archivo test.md..."
Add-Content test.md "# Simulacion de PR desde develop"
git add test.md
git commit -m "Simulacion de cambio en develop"
git push origin develop

Write-Host "Ahora podes ir a GitHub y crear un Pull Request desde 'develop' hacia 'main':"
Write-Host "https://github.com/ccrudolabs/DevSecOps-Multicloud-Blueprint/pulls"
