#creating ec2 instance
resource "aws_instance" "example" {
  ami           = var.ami #ubuntu os
  instance_type = var.instance_type
  key_name =  aws_key_pair.deployer.key_name
  
  tags = {
    Name = "instance-1" #instance name
  }
}

#creating key pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key =  file("C:\\Users\\USER\\OneDrive\\Documents\\terraform a5\\EC2\\terraform-key.pub")
}