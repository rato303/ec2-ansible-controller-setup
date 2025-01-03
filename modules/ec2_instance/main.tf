provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "example-ec2-${var.environment}"
    Environment = var.environment
  }

  user_data = <<-EOF
    #!/bin/bash
    ENVIRONMENT="${var.environment}"  # Terraform変数を環境変数に設定

    sudo apt update -y
    sudo apt install -y docker.io
    if [ "$ENVIRONMENT" = "dev" ]; then
      sudo apt install -y ansible
    fi
  EOF
  
}