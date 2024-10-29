variable "perfil" {
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  default = "172.16.0.0/16"
}

variable "private_subnet" {
  type = string
  default = "172.16.1.0/24"
}

variable "private_subnet-2" {
  type = string
  default = "172.16.2.0/24"
}

variable "vpc_aws_az" {
  type = string
  default = "us-east-1a"
}

variable "vpc_aws_az-2" {
  type = string
  default = "us-east-1b"
}
output "ec2-id" {
  value = aws_instance.ac1-instance.id
}

output "ec2-dns" {
  value = aws_instance.ac1-instance.public_dns
}

output "ec2-public-ip" {
  value = aws_instance.ac1-instance.public_ip
}

output "lb-ip" {
  value = aws_lb.ac1-lb.dns_name
}