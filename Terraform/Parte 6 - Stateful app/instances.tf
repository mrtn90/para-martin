resource "aws_instance" "p6-instance" {
  ami                    = "ami-03ededff12e34e59e"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.p6-private-subnet.id
  vpc_security_group_ids = [aws_security_group.p6-sg.id]
  key_name               = "vockey"
  tags = {
    Name      = "p6-instance"
    terraform = "True"

  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/Documents/ORT/labsuser.cer")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd git curl",
      "git clone https://github.com/mauricioamendola/chaos-monkey-app.git",
      "sudo mv chaos-monkey-app/website/* /var/www/html/",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
    ]
  }
}
