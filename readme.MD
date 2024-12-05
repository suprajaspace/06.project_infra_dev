
data.tf
Data Source: aws_ssm_parameter

https://registry.terraform.io/providers/hashicorp/aws/3.4.0/docs/data-sources/ssm_parameter

https://learn.joindevops.com/learn/home/DAWS-81S/section/535907/lesson/3361270?

Resource: aws_security_group_rule

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.example.cidr_block]
  ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = "sg-123456"
}

main.tf

module "mysql_sg" {
    source = "git::https://github.com/suprajaspace/05.terraform_aws_security_group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "backend_sg" {
    source = "git::https://github.com/suprajaspace/05.terraform_aws_security_group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "backend"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.backend_sg_tags
}

module "frontend_sg" {
    source = "git::https://github.com/suprajaspace/05.terraform_aws_security_group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "frontend"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.frontend_sg_tags
}

open source modules with AWS contribution

https://github.com/terraform-aws-modules

https://github.com/terraform-aws-modules/terraform-aws-ec2-instance

