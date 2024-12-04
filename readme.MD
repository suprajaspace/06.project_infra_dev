
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