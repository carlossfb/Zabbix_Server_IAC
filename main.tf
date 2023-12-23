##################################################################
#_____ NETWORK __________________________________________________#
##################################################################
module "vpc" {
  source = "github.com/carlossfb/VPC_AWS"

  route_config = "0.0.0.0/0"
  sg_name      = "security-group-dev"

  vpc_configs = {
    name = "zabbix"
    cidr = "10.0.0.0/16"
    subnets = [
      {
        name     = "1"
        sub_cidr = "10.0.1.0/24"
      },
      {
        name     = "2"
        sub_cidr = "10.0.2.0/24"
      }

    ]
  }


  sg_ingress_rules = [
    {
      rule_name   = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/32"]
    },
    {
      rule_name   = "zabbix-nginx"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/32"]
    },
    {
      rule_name   = "zabbix-apache"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/32"]
    }
  ]

  sg_egress_rules = [
    {
      rule_name        = "default"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}

##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
#ssh-keygen -f nome_key
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("./${var.key_name}.pub")
}

resource "aws_instance" "vm" {
  ami                         = var.ec2_instance.ami
  instance_type               = var.ec2_instance.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.vpc.subnet_id[0]
  vpc_security_group_ids      = [module.vpc.security_group_id]
  associate_public_ip_address = var.ec2_instance.associate_public_ip_address
  root_block_device {
    volume_size = 20
  }
  user_data = <<-EOF
          #!/bin/bash
          sudo sed -i '/^# *pt_BR.UTF-8/s/^# *//' /etc/locale.gen
          sudo locale-gen pt_BR.UTF-8
          sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8
          source /etc/default/locale
      EOF 

  tags = {
    Name = "vm-zabbix"
  }
}