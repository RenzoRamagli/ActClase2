resource "aws_security_group" "ac1-sg" {
  name   = "terraform-ac1-sg"
  vpc_id = aws_vpc.vpc-ac1.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-ac1-sg"
  }
}

resource "aws_security_group" "ac1-lb-sg" {
  name   = "terraform-ac1-lb-sg"
  vpc_id = aws_vpc.vpc-ac1.id
  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-ac1-lb-sg"
  }
}