module "ec2_instance" {
  source            = "../../modules/ec2_instance"
  ami               = var.ami
  instance_type     = var.instance_type
  region            = var.region
  environment       = "dev"
  security_group_id = var.security_group_id
  key_name          = var.key_name
  ansible_version   = var.ansible_version
}