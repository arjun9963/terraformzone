resource "aws_vpc" "vpc2" {
  cidr_block = var.vpc_network_cidr
  tags = {
    name = local.name
  }
}