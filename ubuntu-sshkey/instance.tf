resource "aws_key_pair" "tf-ubuntu" {
  key_name   = "tf-ubuntu"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "devops-demo" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tf-ubuntu.key_name

tags = {
        Name = "Mario Alcantar Intermediate Terrafrom Test"
    }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh", # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

output "ip" {
 
value="${aws_instance.devops-demo.public_ip}"
 
}