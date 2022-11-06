# # Imagem Ubuntu
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }


# # Instância EC2
# resource "aws_instance" "airflow" {
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = "t3.medium"
#   key_name                    = var.key_pair_name
#   associate_public_ip_address = true
#   security_groups             = [aws_security_group.airflow_sg.id]
#   subnet_id                   = var.airflow_subnet_id


#   tags = {
#     cliente   = var.customer
#   }
# }

# # Security group to allow acces to instance
# resource "aws_security_group" "airflow_sg" {
#   name        = "${var.customer}_airflow_sg"
#   description = "Allow traffic on port 8080 for airflow"
#   vpc_id      = var.vpc_id

# #para interface do airflow
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

# #para interface do flower
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 5555
#     to_port          = 5555
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

# #conexao ssh
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

# #saida para qualquer lugar
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     curso = var.customer
#   }
# }