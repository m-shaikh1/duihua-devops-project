
resource "aws_vpc" "sudos-duihua-vpc" {
  cidr_block = var.cidr_block
  tags = {
    "Name" = "sudos-duihua-vpc"
  }
}

resource "aws_internet_gateway" "sudos-duihua-gateway" {
  vpc_id = aws_vpc.sudos-duihua-vpc.id
  tags = {
    "Name" = "sudos-duihua-gateway"
  }
}

resource "aws_route_table" "sudos-duihua-public-rt" {
  vpc_id = aws_vpc.sudos-duihua-vpc.id
  tags = {
    "Name" = "sudos-duihua-public-rt"
  }
}

resource "aws_route" "sudos-duihua-public-route" {
  route_table_id         = aws_route_table.sudos-duihua-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.sudos-duihua-gateway.id
}


resource "aws_subnet" "sudos-duihua-public_subnet" {
  vpc_id     = aws_vpc.sudos-duihua-vpc.id
  cidr_block = var.public_subnet_cidr_blocks
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "sudos-duihua-public_subnet"
  }
}
resource "aws_subnet" "sudos-duihua-public_subnet2" {
  vpc_id     = aws_vpc.sudos-duihua-vpc.id
  cidr_block = var.public_subnet2_cidr_blocks
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "sudos-duihua-public_subnet2"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.sudos-duihua-public_subnet.id
  route_table_id = aws_route_table.sudos-duihua-public-rt.id
}

resource "aws_security_group" "sudos-duihua-sg" {
  vpc_id = aws_vpc.sudos-duihua-vpc.id
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
    "Name" = "sudos-duihua-sg"
  }
}
