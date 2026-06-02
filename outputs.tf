output "vpc_id" {
  description = "ID unico de la VPC"
  value       = aws_vpc.main.id
}

output "subnet_public_a_id" {
  description = "ID de la Subred Publica A"
  value       = aws_subnet.public_a.id
}

output "subnet_public_b_id" {
  description = "ID de la Subred Publica B"
  value       = aws_subnet.public_b.id
}

output "security_group_id" {
  description = "ID del Security Group perimetral"
  value       = aws_security_group.web.id
}

output "subnet_ids" {
  description = "Lista combinada de subredes publicas"
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}
