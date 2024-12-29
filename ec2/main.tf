provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  # Ubuntu Server 24.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical
  ami           = "ami-0b2cd2a95639e0e5b"
  instance_type = "t2.medium"

  tags = {
    Name = "Terraform-Example"
  }
}