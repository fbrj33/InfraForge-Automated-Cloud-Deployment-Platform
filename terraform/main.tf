resource "aws_security_group" "infraforge" {
  name        = "infraforge-sg"
  description = "Security group for InfraForge application"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "FastAPI"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "infraforge" {
  ami           = "ami-mocked-infraforge"
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.infraforge.id
  ]

  tags = {
    Name        = "InfraForge"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}