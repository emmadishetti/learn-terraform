data "aws_ami" "ami" {
  name_regex       = "centos-*"
  owners           = ["576740149353"]
}
