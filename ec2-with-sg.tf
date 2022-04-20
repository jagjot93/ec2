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

variable "sg_ports" {
  type = list(number)
  default = [80, 443, 8201, 9200]
}

resource "aws_instance" "firstec2" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}

resource "aws_security_group" "custom_sg" {
  name = "custom security group"

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0", "${aws_eip.myeip.public_ip}/32"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id = aws_security_group.custom_sg.id
  network_interface_id = aws_instance.firstec2.primary_network_interface_id
}

resource "aws_eip" "myeip" {
}
