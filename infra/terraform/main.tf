module "network" {
  source = "./modules/network"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

module "security" {
  source = "./modules/security"

  project_name     = var.project_name
  vpc_id           = module.network.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  gateway_port     = var.gateway_port
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  subnet_id         = module.network.subnet_id
  security_group_id = module.security.security_group_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  gateway_port      = var.gateway_port
}
