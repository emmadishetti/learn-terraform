data "aws_ami" "ami" {
  executable_users = ["amazon"]
  most_recent      = true
  name_regex       = "centos-*"
  owners           = ["576740149353"]
}
output "ami" {
  value = data.aws_ami.ami
}
