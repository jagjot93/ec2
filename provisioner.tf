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

  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      host = "${self.public_ip}"
      private_key = file("/root/terraform_provisioners/terraform.pem")
    }

    inline = [
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]


  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ip.txt"
  }
}
