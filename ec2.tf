resource "aws_instance" "private_ec2" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t3.micro"
    subnet_id     = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    associate_public_ip_address = false

    tags = {
      Name = "private-app-server"
    }
}

//ALB SG

resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
        Name = "alb-sg"
  }
}

//EC2 SG

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "ec2-sg"
  }
}

resource "aws_security_group" "endpoint_sg" {
  name        = "endpoint-sg"
  description = "Security group for VPC endpoints"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "Allow HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "endpoint-security-group"
  }
}

