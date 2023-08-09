variable "ami" {
  default = "ami-03265a0778a880afb"
}
variable "security_groups" {
  default = [ "sg-0f56c7274c7d31689" ]
}
variable "instance_type" {
  default = "t2.micro"
}
variable "zone_id" {
  default = "Z009544921RTWVTZ5968R"
}

variable "components" {

  default = {
    frontend = { name = "frontend-dev"}
    catalogue = { name = "catalogue-dev" }
    mongodb = { name = "mongodb-dev"}
    user = { name = "user-dev"}
    redis = { name = "redis-dev"}
    cart = { name = "cart-dev"}
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev"}
    payment = { name = "payment-dev"}
    rabbitmq = { name = "rabbitmq-dev"}
  }
}

resource "aws_instance" "instance" {

  for_each = var.components

  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {

    Name = lookup(each.value, "name", null)
  }
}

