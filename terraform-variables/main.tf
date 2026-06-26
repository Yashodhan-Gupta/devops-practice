# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# Create Subnet
resource "aws_subnet" "ltm_s1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create Route Table
resource "aws_route_table" "ltm_route_table" {
  vpc_id = aws_vpc.my_vpc.id   

  route {
    cidr_block = var.destination_cidr
    gateway_id = aws_internet_gateway.my_gateway.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "ltm_assoc" {
  subnet_id      = aws_subnet.ltm_s1.id
  route_table_id = aws_route_table.ltm_route_table.id
}

# Create Security Group
resource "aws_security_group" "my_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  # Inbound SSH Rule
  ingress {
    description = "SSH access"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  # Inbound HTTP Rule
  ingress {
    description = "HTTP access"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  # Outbound Rule
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.destination_cidr]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Create EC2 Instance
resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.ltm_s1.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = var.instance_name
  }
}
