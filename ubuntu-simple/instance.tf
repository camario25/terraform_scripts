resource "aws_instance" "DEVOPS" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = [aws_security_group.Mario_allow_ssh.id]
  subnet_id              = aws_subnet.subnet-mario.id
  tags = {
        Name = "Mario Alcantar July 21 Terrafrom Test"
    }
}

resource "aws_vpc" "vpc-mario" {
    cidr_block = "198.168.0.0/24"
    tags = {
        Name = "tf-vpc-mario"
    }
  
}

resource "aws_subnet" "subnet-mario" {
    vpc_id      = aws_vpc.vpc-mario.id
    cidr_block  = "198.168.0.0/24"
    map_public_ip_on_launch = true
    depends_on = [aws_internet_gateway.gateway]
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.vpc-mario.id
  
}

resource "aws_security_group" "Mario_allow_ssh" {
  name        = "Mario_allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc-mario.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["76.21.xx.xx/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Mario_allow_ssh"
  }
}

