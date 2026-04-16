resource "aws_instance" "nginx" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.nginx_sg]

  user_data = file("${path.module}/../../scripts/install_nginx.sh")

  tags = { Name = "nginx" }
}

resource "aws_instance" "backend" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.app_sg]

  user_data = templatefile("${path.module}/../../scripts/install_nginx.sh", {
    backend_ip = aws_instance.backend.private_ip
  })

  tags = { Name = "backend" }
}
