# Módulo de Terraform para Redes AWS (VPC)

## Objetivos del repositorio
El objetivo de este repositorio es proporcionar un componente de infraestructura desacoplado, modular y altamente reutilizable que automatice la creación y configuración de los recursos de red indispensables en Amazon Web Services (AWS). Está diseñado siguiendo las mejores prácticas de codificación para integrarse de forma nativa en flujos de trabajo orquestados por un código principal.

## Propósito general del código Terraform
Este módulo permite abstraer la complejidad de la red en AWS mediante la parametrización completa de sus componentes. Al ser invocado, se encarga de aprovisionar de manera consistente:
* Una Virtual Private Cloud (VPC) aislada.
* Subredes (Subnets) distribuidas para la segmentación de tráfico.
* Grupos de Seguridad (Security Groups) para el control de accesos a nivel de red.

## Instrucciones básicas de uso

### Requisitos previos
* Terraform instalado (versión `>= 1.0.0`).
* Credenciales de AWS configuradas en el entorno local o de ejecución.

### Ejemplo de invocación
Para utilizar este módulo en tu entorno principal, añade el siguiente bloque de código en tu archivo `main.tf`:

```
module "networking" {
  source = "[github.com/AVAUY1105Grupo1/terraform-aws-vpc-auy1105-grupo-1?ref=v1.0.0](https://github.com/AVAUY1105Grupo1/terraform-aws-vpc-auy1105-grupo-1?ref=v1.0.0)"

  vpc_cidr             = "10.0.0.0/16"
  environment          = "production"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
}
```
## Variables de Entrada (Inputs)
* vpc_cidr (string): Bloque CIDR para la VPC (Ej: 10.0.0.0/16).

* environment (string): Etiqueta para identificar el entorno (Ej: desarrollo, produccion).

* public_subnet_cidrs (list): Lista de CIDRs para las subredes públicas.

* private_subnet_cidrs (list): Lista de CIDRs para las subredes privadas.

## Variables de Salida (Outputs)
* Este módulo expone los siguientes datos esenciales para que otros módulos (como Cómputo o Almacenamiento) puedan consumirlos:

* vpc_id: El ID de la VPC creada de manera centralizada.

* subnet_ids: Una lista con los IDs de las subredes públicas y privadas generadas.
