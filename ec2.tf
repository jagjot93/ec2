data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.2022*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  key_name = "terraform"

#  associate_public_ip_address = false  # this was removed as the subnet was by default public

  network_interface {
    network_interface_id = aws_network_interface.interface0.id
    device_index = 0
  }

}
