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


resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-dev.devops7874.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
