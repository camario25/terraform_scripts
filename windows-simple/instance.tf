resource "aws_key_pair" "mykey" {
  key_name   = "ah-devops"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "win-mario" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  tags = {
    Name = "Mario Alcantar Win_AD_terraform"
  }
}

resource "aws_security_group" "Mario_allow_rdp" {
  name        = "Mario_allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "RDP from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Mario_allow_rdp"
  }
}



output "ip" {
 
value="${aws_instance.win-mario.public_ip}"
 
}