Todos los cambios notables de este módulo de red serán documentados en este archivo utilizando la convención [Semantic Versioning](https://semver.org/lang/es/).

## [1.0.0] - 2026-06-04
### Añadido
- Versión inicial estable del módulo de redes de manera completamente desacoplada.
- Definición de recursos principales en `main.tf` para la creación de VPC, subredes y security groups.
- Configuración de outputs mínimos obligatorios: `vpc_id` y `subnet_ids`.
- Inclusión de descripciones exhaustivas en `variables.tf` para facilitar la parametrización.
- Creación de la carpeta `examples/` con un caso práctico de despliegue funcional.

## [0.1.0] - 2026-06-02
### Añadido
- Estructura base preliminar del módulo de infraestructura de red.
- Archivos de configuración de versiones de proveedores independientes (`versions.tf`).
- Archivo `.gitignore` adaptado para excluir directorios `.terraform/` y datos sensibles.
