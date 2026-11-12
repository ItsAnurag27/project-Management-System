variable "aws_region" {
  description = "AWS region for the deployment."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used for AWS resource names and tags."
  type        = string
  default     = "unitify"
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for Docker Compose and PostgreSQL."
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Existing EC2 key pair name. Leave empty to disable SSH key login."
  type        = string
  default     = ""
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH to the instance. Leave empty to disable SSH ingress."
  type        = string
  default     = ""
}

variable "gateway_port" {
  description = "Public port exposed by the API gateway."
  type        = number
  default     = 8090
}
