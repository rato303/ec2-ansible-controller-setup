provider "aws" {
  region = var.region
}

resource "aws_instance" "ansible_controller" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "ansible-controller-${var.environment}"
    Environment = var.environment
  }

  user_data = <<-EOF
    #!/bin/bash
    ENVIRONMENT="${var.environment}"  # Terraform変数を環境変数に設定
    ANSIBLE_VERSION="${var.ansible_version}" # Terraform変数を環境変数に設定

    sudo apt update -y
    sudo apt install -y docker.io
    sudo usermod -aG docker ubuntu # `ubuntu`ユーザーを docker グループに追加する
    su - ubuntu -c "newgrp docker"  # ubuntu ユーザーのセッションを再読み込み
    docker pull alpine/ansible:$ANSIBLE_VERSION
    if [ "$ENVIRONMENT" = "dev" ]; then
      sudo apt install -y ansible
    fi
  EOF
  
}