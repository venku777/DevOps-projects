resource "aws_instance" "pub-ins" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.pub-sub.id
  key_name = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
   security_groups = [ aws_security_group.allow_ssh_and_http.id ]

  tags = {
    Name = "public-instance"
  }
}