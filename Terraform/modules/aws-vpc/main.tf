resource "aws_vpc" "project-vpc" {
  cidr_block = var.cidr_block
  tags = {
    "Name" = "project-vpc"
  }
}

resource "aws_internet_gateway" "project-gateway" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    "Name" = "project-gateway"
  }
}

resource "aws_route_table" "project-public-rt" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    "Name" = "project-public-rt"
  }
}

resource "aws_route" "project-public-route" {
  route_table_id         = aws_route_table.project-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.project-gateway.id
}


resource "aws_subnet" "project-public_subnet" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.public_subnet_cidr_blocks
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "project-public_subnet"
  }
}
resource "aws_subnet" "project-public_subnet2" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = var.public_subnet2_cidr_blocks
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "project-public_subnet2"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.project-public_subnet.id
  route_table_id = aws_route_table.project-public-rt.id
}

resource "aws_security_group" "project-sg" {
  vpc_id = aws_vpc.project-vpc.id
  ingress {
    description = "Security Group to Allow SSH and Jenkins Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "port 9000"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "port 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "project-sg"
  }
}
