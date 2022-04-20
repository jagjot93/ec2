resource "aws_vpc" "main" {
  #this will be imported
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "172.31.16.0/20" # same as already exiting. This is imported
}


resource "aws_network_interface" "interface0" {
  subnet_id = aws_subnet.subnet1.id
  security_groups = ["sg-0412a7918d17fe211"]
}
