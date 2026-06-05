# Configuración práctica del entorno de pruebas utilizando el módulo local

provider "aws" {
  region = "us-east-1"
}

module "redes_prueba" {
  source = "../../" # Hace referencia al código local de la raíz del repositorio

  vpc_cidr             = "10.50.0.0/16"
  environment          = "test"
  public_subnet_cidrs  = ["10.50.1.0/24"]
  private_subnet_cidrs = ["10.50.10.0/24"]
}

output "id_de_la_vpc_creada" {
  description = "Muestra el ID de la VPC devuelto por el módulo"
  value       = module.redes_prueba.vpc_id
}

output "ids_de_las_subredes" {
  description = "Muestra la lista de subredes creadas"
  value       = module.redes_prueba.subnet_ids
}
