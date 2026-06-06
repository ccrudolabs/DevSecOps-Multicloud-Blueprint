# DevSecOps Multicloud Blueprint

**Autor:** Carlos Crudo  
**Propiedad:** CloudSolutionsIoT®  
**Aviso:** Propiedad privada de CloudSolutionsIoT® marca registrada. Autor: Carlos Crudo. Uso restringido y controlado.

## Objetivo

Estructura base para infraestructura como código, DevSecOps, seguridad, gobernanza y automatización multicloud.

## Ambientes

| Ambiente | Rama sugerida | Uso |
|---|---|---|
| DEV | develop | Desarrollo |
| QA | qa | Validación |
| PRD | main | Producción |

## Seguridad

- No subir secretos.
- No subir .tfstate.
- No subir .tfvars.
- Usar Pull Request obligatorio.
- Activar Secret Scanning, Push Protection, Dependabot y CodeQL.
