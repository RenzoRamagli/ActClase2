resource "aws_instance" "ac1-instance" {
  ami                    = "ami-06b21ccaeff8cd686"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ac1-sg.id]
  tags = {
    Name      = "ac1-instance"
    terraform = "True"

  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./labsuser.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd git curl",
      "git clone https://github.com/mauricioamendola/chaos-monkey-app.git",
      "sudo mv chaos-monkey-app/website/* /var/www/html/",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
    ]
  }
}
