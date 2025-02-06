
module "webserver" {

  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/ec2"
  #source = "../modules-repo/modules/ec2"

  vpc_security_group_ids = [module.web_security_groups.aws_security_group_id]
  ami                    = data.aws_ami.amazon-ami.image_id
  env                    = var.env
  keyname                = var.keyname
  subnet_id              = var.subnet_id
  app_name               = var.app_name
  department             = var.department
  ec2_tags               = var.ec2_tags
  user_data              = var.user_data
  instance_type          = var.env == "prod" ? var.instance_type_prod : var.instance_type_dev
}
module "web_security_groups" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/security_resources"
  # source = "../modules-repo/modules/security_resources"
  app_name            = var.app_name
  department          = var.department
  source_ip_range     = "${data.http.ip.response_body}/32"
  outbound_ip_range   = var.outbound_ip_range
  env                 = var.env
  description         = "This is Webserver security group to allow inbound connection from source ALB"
  sg_name             = "web_sg"
  ingress_cidr_blocks = var.ingress_cidr_blocks_web
}

module "alb_security_groups" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/security_resources"
  #source = "../modules-repo/modules/security_resources"
  app_name            = var.app_name
  department          = var.department
  env                 = var.env
  description         = "This is ALB security group to allow inbound connection from source IP"
  sg_name             = "alb_sg"
  ingress_cidr_blocks = var.ingress_cidr_blocks_alb
  outbound_ip_range   = var.outbound_ip_range
  egress_protocol     = var.egress_protocol

}

module "rds_security_groups" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/security_resources"
  #  source              = "../modules-repo/modules/security_resources"
  app_name            = var.app_name
  department          = var.department
  source_ip_range     = "${data.http.ip.response_body}/32"
  outbound_ip_range   = var.outbound_ip_range
  env                 = var.env
  description         = "This is RDS security group to allow connection from webserver"
  sg_name             = "rds_sg"
  ingress_cidr_blocks = var.ingress_cidr_blocks_rds

}

module "alb" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/alb"
  #  source          = "../modules-repo/modules/alb"
  app_name        = var.app_name
  department      = var.department
  env             = var.env
  vpc_id          = var.vpc_id
  http_port       = var.http_port
  security_groups = module.alb_security_groups.aws_security_group_id
  target_id       = module.webserver.aws_instance_id
  public_subnets  = data.aws_subnets.public.ids

}

module "static_content" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/static_content"
  #  source     = "../modules-repo/modules/static_content"
  env        = var.env
  app_name   = var.app_name
  department = var.department

}

module "rds_instance" {
  source = "github.com/vikas-awspro/aapkavikas-modules.git//modules/rds"
  #  source            = "../modules-repo/modules/rds"
  app_name          = var.app_name
  department        = var.department
  env               = var.env
  allocated_storage = var.allocated_storage
  db_name           = var.db_name
  engine            = var.engine
  instance_class    = var.instance_class
  username          = var.username
  password          = var.password
  #parameter_group_name = "default.mysql8.0"
  private_subnets        = data.aws_subnets.private.ids
  vpc_security_group_ids = [module.rds_security_groups.aws_security_group_id]

}
