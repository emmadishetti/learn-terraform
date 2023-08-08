data "aws_ami_ids" "ami" {
  most_recent = true
  name_regex       = "Centos-*"
  owners           = ["576740149353"]
}
#output "ami" {
  value= data."aws_ami"."ami"
}#