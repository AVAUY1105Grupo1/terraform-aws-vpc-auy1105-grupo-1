variable "vpc_name" {
  description = "Nombre asignado como etiqueta (Tag: Name) a la VPC"
  type        = string
  default     = "VampireNightXX-vpc"
}

variable "vpc_cidr_block" {
  description = "Bloque de direccionamiento IP primario para la VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_a_name" {
  description = "Nombre asignado a la Subred Publica de la zona A"
  type        = string
  default     = "VampireNightXX-subnet-a"
}

variable "subnet_a_cidr" {
  description = "Bloque de direccionamiento IP para la Subred Publica A"
  type        = string
  default     = "10.1.1.0/24"
}

variable "subnet_a_az" {
  description = "Zona de disponibilidad fisica en AWS para la Subred Publica A"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_b_name" {
  description = "Nombre asignado a la Subred Publica de la zona B"
  type        = string
  default     = "VampireNightXX-subnet-b"
}

variable "subnet_b_cidr" {
  description = "Bloque de direccionamiento IP para la Subred Publica B"
  type        = string
  default     = "10.1.2.0/24"
}

variable "subnet_b_az" {
  description = "Zona de disponibilidad fisica en AWS para la Subred Publica B"
  type        = string
  default     = "us-east-1b"
}

variable "internet_gateway_name" {
  description = "Nombre asignado al Internet Gateway para habilitar salida publica"
  type        = string
  default     = "VampireNightXX-igw"
}

variable "route_table_name" {
  description = "Nombre asignado a la Tabla de Enrutamiento Publica"
  type        = string
  default     = "VampireNightXX-rt"
}

variable "security_group_name" {
  description = "Nombre asignado al Security Group perimetral"
  type        = string
  default     = "VampireNightXX-sg"
}

variable "ssh_port" {
  description = "Puerto numerico destinado para habilitar el trafico SSH"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Puerto numerico destinado para habilitar la navegacion web HTTP"
  type        = number
  default     = 80
}

variable "allowed_cidr_blocks" {
  description = "Lista de bloques CIDR remotos autorizados para ingresar a los puertos abiertos"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
