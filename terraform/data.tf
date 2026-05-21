data "aws_ami" "amazon" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc-*"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  tags = {
    Name = "*-public-*"
  }
}

data "aws_key_pair" "key" {
  filter {
    name   = "tag:Component"
    values = ["ec2"]
  }
}
