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


resource "aws_db_instance" "ntire" {
  allocated_storage        = 20
  db_name                  = "emp"
  engine                   = "mysql"
  engine_version           = "8.0"
  instance_class           = "db.t3.micro"
  username                 = "root"
  password                 = "rootroot"
  skip_final_snapshot      = true
  db_subnet_group_name = aws_db_subnet_group.ntire.name
  identifier               = "qtntiredbformtf"
  vpc_security_group_ids   = [aws_security_group.dbsg.id]
  depends_on = [
    aws_db_subnet_group.ntire,
    aws_vpc.vpc1,
    aws_subnet.subnets
  ]
}