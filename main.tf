resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_network_cidr
  tags = {
    name = local.name
  }
}


resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.web1_subnet_cidr
  tags = {
    name = "web1"
  }

  depends_on = [
    aws_vpc.vpc1
  ]
}