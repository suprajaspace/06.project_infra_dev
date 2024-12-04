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
#MySQL allowing connection on 3306 from the instances attached to Backend SG
# resource "aws_security_group_rule" "mysql_backend" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#   source_security_group_id       = [module.backend_sg.id]
#   security_group_id = module.mysql_sg.id
# }