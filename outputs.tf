#EC2 Instance Detail 
output "webserver_public_ip" {
  value = module.webserver.webserver_pub_ip
}

output "webserver_priv_ip" {
  value = module.webserver.webserver_priv_ip
}


output "webserver_ami" {
  value = module.webserver.webserver_ami
}

output "web_app_endpoint" {
  value = "http://${module.alb.dns_name}"
}

output "webserver_security_group_id" {
  value = "Webserver Security Group id is ${module.web_security_groups.aws_security_group_id}"
}

output "alb_security_group_id" {
  value = module.alb_security_groups.aws_security_group_id
}


output "rds_security_group_id" {
  value = module.rds_security_groups.aws_security_group_id
}

output "alb_dns_name" {
  value = module.alb.dns_name
}

output "rds_endpoint" {
  value = module.rds_instance.rds_endpoint
}
