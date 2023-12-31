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
    frontend = { name = "frontend"}
    catalogue = { name = "catalogue" }
    mongodb = { name = "mongodb"}
    user = { name = "user"}
    redis = { name = "redis"}
    cart = { name = "cart"}
    mysql = { name = "mysql" }
    shipping = { name = "shipping"}
    payment = { name = "payment"}
    rabbitmq = { name = "rabbitmq"}
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

resource "aws_route53_record" "record" {

  for_each = var.components

  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null)}-dev.devops7874.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
}
output "instance" {
  value = aws_instance.instance
}
