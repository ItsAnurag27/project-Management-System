variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = string
}

variable "gateway_port" {
  type = number
}

resource "aws_security_group" "this" {
  name        = "${var.project_name}-ec2"
  description = "Access for the Unitify EC2 host"
  vpc_id      = var.vpc_id

  ingress {
    description = "API gateway"
    from_port   = var.gateway_port
    to_port     = var.gateway_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.allowed_ssh_cidr == "" ? [] : [var.allowed_ssh_cidr]

    content {
      description = "SSH administration"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}
