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

output "ip" {
 
value="${aws_instance.win-mario.public_ip}"
 
}