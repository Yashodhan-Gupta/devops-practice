resource "aws_vpc" "ltm-vpc-1" {
    cidr_block = "192.167.0.0/16"

    tags = {
      Name="ltm-vpc-1"
    }
  
}
