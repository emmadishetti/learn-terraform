resource "aws_instance" "instance" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-0f56c7274c7d31689" ]

  tags = {
    Name = "HelloWorld"
  }
}