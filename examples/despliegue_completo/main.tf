### Ejemplo de invocación
Para utilizar este módulo en tu entorno principal, añade el siguiente bloque de código en tu archivo `main.tf`:

# Configuración práctica del entorno de pruebas utilizando el módulo local

provider "aws" {
  region = "us-east-1"
}

module "redes_prueba" {
  source = "../../" # Hace referencia al código local de la raíz del repositorio

  vpc_cidr_block        = "10.50.0.0/16"
  vpc_name              = "vpc-test-grupo1"
  
  subnet_a_cidr         = "10.50.1.0/24"
  subnet_a_az           = "us-east-1a"
  subnet_a_name         = "subnet-test-a"
  
  subnet_b_cidr         = "10.50.2.0/24"
  subnet_b_az           = "us-east-1b"
  subnet_b_name         = "subnet-test-b"

  internet_gateway_name = "igw-test"
  route_table_name      = "rt-test-publica"
  
  security_group_name   = "sg-test-web"
  ssh_port              = 22
  http_port             = 80
  allowed_cidr_blocks   = ["0.0.0.0/0"]
}

# Recuerda definir estos outputs en el archivo outputs.tf del módulo raíz
output "id_de_la_vpc_creada" {
  value = module.redes_prueba.vpc_id
}

output "id_grupo_seguridad" {
  value = module.redes_prueba.security_group_id
}
