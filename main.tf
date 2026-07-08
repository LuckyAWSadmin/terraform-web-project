provider "aws" {
  region = var.region

  
  }

######### Latest Amazon Linux###########

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

##### Data Source for MyIP#######
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
 
}

locals {
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"
}



#################### Security Group ################
resource "aws_security_group" "web_sg" {

  name = "web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["149.173.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["149.173.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


######## SG Rules ######
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.web_sg.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"

  cidr_blocks = [local.my_ip]
}

########  Ec2 Instance ###########

resource "aws_instance" "web" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  user_data = file("user_data.sh")

  tags = {
    Name = "laxman-web01"
  }
}

###########33
