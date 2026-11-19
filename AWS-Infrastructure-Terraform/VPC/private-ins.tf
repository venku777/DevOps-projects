resource "aws_instance" "example" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.pri-sub.id
  key_name = aws_key_pair.deployer.key_name
   security_groups = [ aws_security_group.allow_ssh_and_http.id ]

  tags = {
    Name = "pri-instance"
  }
}

#creating key pair
resource "aws_key_pair" "deployer" {
  key_name   = "vpc-key"
  public_key = file("C:\\Users\\USER\\OneDrive\\Documents\\terraform a5\\VPC\\vpc-key")
}