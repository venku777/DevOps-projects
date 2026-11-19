#create vpc
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-1"
  }
}



#creating public subnet
resource "aws_subnet" "pub-sub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/21"

  tags = {
    Name = "pub-sub"
  }
}

#creating private subnet
resource "aws_subnet" "pri-sub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.8.0/21"

  tags = {
    Name = "pri-sub"
  }
}

#create internet gatway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}

#creat private route table
resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.vpc.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id #establishing connection to nat gateway
  }

tags = {
    Name ="pri-rt"
  }
}

#creat public route table
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  

  tags = {
    Name ="pub-rt"
  }
}

#attaching public subnet to public route table
resource "aws_route_table_association" "pub-associ" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-rt.id
}

#attaching private subnet to private route table
resource "aws_route_table_association" "pri-associ" {
  subnet_id      = aws_subnet.pri-sub.id
  route_table_id = aws_route_table.pri-rt.id
}