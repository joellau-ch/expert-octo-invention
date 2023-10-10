terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }
}

# ---------------------
#    ECR
# ---------------------
resource "aws_ecr_repository" "thales-dashboard" {
  name                 = "thales_dashboard"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# ---------------------
#    VPC(s)
# ---------------------
resource "aws_vpc" "thales-vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "Thales (Staging)"
  }
}

resource "aws_subnet" "thales-subnet" {
  vpc_id     = aws_vpc.thales-vpc.id
  cidr_block = "172.16.10.0/24"

  tags = {
    name = "Thales (Staging)"
  }
}

# ---------------------
#    EC2 Instance(s)
# ---------------------

data "aws_ami" "amzn-linux-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "thales-dashboard-be" {
  ami           = data.aws_ami.amzn-linux-ami.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.thales-subnet.id

  tags = {
    Name = "Thales Dashboard BE (Staging)"
  }
}
