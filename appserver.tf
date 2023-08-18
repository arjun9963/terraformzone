resource "aws_key_pair" "private" {
  key_name  = "ntire"
  public_key = file(var.public_key_path)
  tags = {
    createdBy = "terraform"
  }
}