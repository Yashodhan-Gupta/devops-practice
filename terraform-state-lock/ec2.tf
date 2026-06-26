resource "aws_instance" "my_instance" {
    ami="ami-06970347c8577523c"
    instance_type = "t2.micro"
  
   

    tags = {
      Name="my-instance"

    }
  
}


