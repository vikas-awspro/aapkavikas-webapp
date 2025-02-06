ami                = "ami-0b4624933067d393a"
instance_type_prod = "t3.micro"
instance_type_dev  = "t2.micro"
env                = "prod"
region             = "us-east-2"
keyname            = "webserver-us-east-2"
subnet_id          = "subnet-08304d6d5fbb5a6d2"
app_name           = "aapkavikas"
department         = "Learning"
vpc_id             = "vpc-049aa74096225273b"
user_data          = "userdata-script.sh"
ingress_port       = 80
http_port          = 80
sg_name            = "test_sg"
ssh_port           = 22
ingress_protocol   = "tcp"
egress_protocol    = "-1"
#source_ip_range          = "117.212.226.22"
outbound_ip_range = "0.0.0.0/0"
ec2_tags = {
  Name = "Webserver"
}

ingress_cidr_blocks_web = [{
  cidr_ipv4           = "0.0.0.0/0"
  from_port           = 80
  to_port             = 80
  ip_protocol         = "tcp"
  sg_rule_description = "http port"
  },
  {
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 443
    to_port             = 443
    ip_protocol         = "tcp"
    sg_rule_description = "https port"
}]

#ALB Variables 
description = "Allow http inbound traffic and all outbound traffic on ALB"
ingress_cidr_blocks_alb = [{
  cidr_ipv4           = "0.0.0.0/0"
  from_port           = 80
  to_port             = 80
  ip_protocol         = "tcp"
  sg_rule_description = "http port"
  },
  {
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 443
    to_port             = 443
    ip_protocol         = "tcp"
    sg_rule_description = "https port"
}]
#RDS Variables
allocated_storage = 20
db_name           = "aapkavikasdb"
engine            = "mysql"
instance_class    = "db.t4g.micro"
username          = "vikasadmin"
password          = "admin1234"
#db_subnets        = ["subnet-08304d6d5fbb5a6d2", "subnet-0b25e9e99baaa986a", "subnet-0b54a087add13b19a"]
mysql_port = 3306
ingress_cidr_blocks_rds = [{
  cidr_ipv4           = "0.0.0.0/0"
  from_port           = 3306
  to_port             = 3306
  ip_protocol         = "tcp"
  sg_rule_description = "mysql port"
}]
