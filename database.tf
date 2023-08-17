data "aws_subnets" "db" {
  filter {
    name   = "tag:name"
    values = var.db_subnet_names
  }

}

resource "aws_db_subnet_group" "ntire" {
  name       = "ntire"
  subnet_ids = data.aws_subnets.db.ids
  tags = {
    name = "ntire"
  }
  depends_on = [
    aws_subnet.subnets,
    data.aws_subnets.db

  ]

}