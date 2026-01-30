# Configure the Terraform settings, including the required providers and their versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

# Configure the AWS Provider with a specific region
provider "aws" {
  region = "us-west-2"
}

# Define a data source to look up the most recent Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Define the EC2 instance resource
resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  # Optional: User data to run a script when the instance launches (e.g., install a web server)
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
              EOF

  # Optional: Associate with a public IP in a default VPC subnet
  associate_public_ip_address = true

  tags = {
    Name = "TerraformEC2Example"
  }
}
