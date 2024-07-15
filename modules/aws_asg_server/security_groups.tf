#Create ALB Security Group
resource "aws_security_group" "alb-sg" {
  vpc_id = var.vpc_id
  name   = var.sg_alb
  description = "security group that allows ALB from port 80 and 443"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.sg_alb
    },
  )
}

resource "aws_security_group" "webserver_security_group" {
  name        = var.sg_webserver
  description = "Allow Traffic to Web Servers"
  vpc_id      = var.vpc_id

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.sg_webserver
    },
  )
}

