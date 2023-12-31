﻿## Preview

![VPC GRAPH PREVIEW](/DOCS/graph.png "Zabbix Server Example")


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/carlossfb/VPC_AWS | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.vm](https://registry.terraform.io/providers/hashicorp/aws/5.26.0/docs/resources/instance) | resource |
| [aws_key_pair.key](https://registry.terraform.io/providers/hashicorp/aws/5.26.0/docs/resources/key_pair) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_instance"></a> [ec2\_instance](#input\_ec2\_instance) | n/a | <pre>object({<br>    ami                         = string<br>    instance_type               = string<br>    associate_public_ip_address = bool<br>  })</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | KMS key pair name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | Ip da sua VM |

## Get Started

Requirements for Zabbix Server 6.4:
Database: Mysql (included)
Zabbix Server (Included)
Configuration (Included)

Download Script: https://github.com/carlossfb/Zabbix_6.4/blob/main/deb11_zabbix6.4_mysql_apache.sh
