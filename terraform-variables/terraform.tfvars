aws_region = "ap-south-1"

vpc_cidr = "192.167.0.0/16"
vpc_name = "my-vpc"

subnet_cidr = "192.167.1.0/24"
subnet_az   = "ap-south-1a"
subnet_name = "ltm-s1"

igw_name = "my-gateway"

route_table_name = "my-rt"
destination_cidr = "0.0.0.0/0"

security_group_name        = "my-security-group"
security_group_description = "Allow SSH and HTTP"

ssh_port     = 22
http_port    = 80
allowed_cidr = "0.0.0.0/0"

ami_id        = "ami-06970347c8577523c"
instance_type = "t2.micro"
instance_name = "my-instance"
