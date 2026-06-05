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

```hcl
module "networking" {
  source = "[github.com/AVAUY1105Grupo1/terraform-aws-vpc-auy1105-grupo-1?ref=v1.0.0](https://github.com/AVAUY1105Grupo1/terraform-aws-vpc-auy1105-grupo-1?ref=v1.0.0)"

  vpc_cidr_block        = "10.0.0.0/16"
  vpc_name              = "vpc-produccion"
  
  subnet_a_cidr         = "10.0.1.0/24"
  subnet_a_az           = "us-east-1a"
  subnet_a_name         = "subnet-publica-a"
  
  subnet_b_cidr         = "10.0.2.0/24"
  subnet_b_az           = "us-east-1b"
  subnet_b_name         = "subnet-publica-b"

  internet_gateway_name = "igw-principal"
  route_table_name      = "rt-publica"
  
  security_group_name   = "sg-web-acceso"
  ssh_port              = 22
  http_port             = 80
  allowed_cidr_blocks   = ["0.0.0.0/0"]
}
```

## Variables de Entrada (Inputs)
Este módulo requiere las siguientes variables para su correcta configuración:

* vpc_cidr_block (string): Bloque CIDR para la VPC.

* vpc_name (string): Etiqueta de nombre para la VPC.

* subnet_a_cidr / subnet_b_cidr (string): Bloques CIDR para las subredes públicas A y B.

* subnet_a_az / subnet_b_az (string): Zonas de disponibilidad para las subredes.

* subnet_a_name / subnet_b_name (string): Nombres asignados a las subredes.

* internet_gateway_name (string): Nombre para el Internet Gateway.

* route_table_name (string): Nombre para la tabla de enrutamiento pública.

* security_group_name (string): Nombre asignado al grupo de seguridad web.

* ssh_port / http_port (number): Puertos permitidos en las reglas de ingreso (ingress).

* allowed_cidr_blocks (list): Lista de bloques CIDR permitidos para acceder a la red.

## Variables de Salida (Outputs)
Asegúrate de tener un archivo outputs.tf que exponga estos datos para que el módulo de cómputo los utilice:

* vpc_id: El ID de la VPC creada.

* subnet_a_id / subnet_b_id: Los IDs de las subredes públicas (para instanciar el EC2).

* security_group_id: El ID del grupo de seguridad web creado (aws_security_group.web.id).
