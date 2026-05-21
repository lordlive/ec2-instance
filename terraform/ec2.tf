resource "aws_instance" "this" {
  count         = length(local.instance_name)
  ami           = data.aws_ami.amazon.id
  instance_type = "t3.micro"
  subnet_id     = element(data.aws_subnets.public_subnets.ids, count.index % length(data.aws_subnets.public_subnets.ids))

  vpc_security_group_ids = [aws_security_group.this.id]

  key_name = data.aws_key_pair.key.key_name

  tags = {
    Name        = "${var.app_name}-${var.environment}"
    app_version = var.app_version
  }
}

# resource "aws_network_interface" "example" {
#   subnet_id   = aws_subnet.my_subnet.id
#   private_ips = ["172.16.10.100"]

#   tags = {
#     Name = var.app_name-var.environment
#   }
# }
