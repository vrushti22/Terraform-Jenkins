resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.project_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"

  subnet_ids = [aws_subnet.private_subnet.id]

  security_group_ids = [aws_security_group.ec2_sg.id]

  private_dns_enabled = true

  tags = {
    Name = "ecr-api"
  }
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.project_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"

  subnet_ids = [aws_subnet.private_subnet.id]

  security_group_ids = [aws_security_group.ec2_sg.id]

  private_dns_enabled = true

   tags = {
    Name = "ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.project_vpc.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.private_rt.id
  ]

  tags = {
    Name = "s3-endpoint"
  }
}

resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id            = aws_vpc.project_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private_subnet.id
  ]

  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "ssm-msg-endpoint"
  }
}

resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id            = aws_vpc.project_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private_subnet.id
  ]

  security_group_ids = [
    aws_security_group.endpoint_sg.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "ec2-msg-ep"
  }
}
