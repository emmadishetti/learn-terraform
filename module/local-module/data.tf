data "aws_ami_ids" "ami" {
  name_regex       = "Centos-*"
  owners           = ["576740149353"]
}

output "ami" {
   value = data.aws_ami_ids.ami
}