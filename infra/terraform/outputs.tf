output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "gateway_url" {
  value = "http://${module.ec2.public_ip}:${var.gateway_port}"
}
