variable "ami" {
  type        = string
  default     = "test"
  description = "value"
}

variable "instance_type_prod" {
  type        = string
  default     = "t2.micro"
  description = "value"
}
variable "instance_type_dev" {
  type        = string
  default     = "t2.micro"
  description = "value"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "value"
}
variable "env" {
  type        = string
  default     = "dev"
  description = "value"
}

variable "keyname" {
  type        = string
  default     = "test"
  description = "value"
}
variable "subnet_id" {
  type        = string
  default     = "test"
  description = "value"

}
variable "app_name" {
  type        = string
  default     = "value"
  description = "value"
}
variable "department" {
  type        = string
  default     = "value"
  description = "value"
}
variable "vpc_id" {
  type        = string
  default     = "value"
  description = "value"
}
variable "user_data" {
  type        = string
  default     = "value"
  description = "value"
}

#Security Group variables 
variable "ingress_cidr_blocks_web" {
  type = list(object({
    cidr_ipv4           = string
    from_port           = number
    to_port             = number
    ip_protocol         = string
    sg_rule_description = string
  }))

  default = [{
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 80
    to_port             = 80
    ip_protocol         = "tcp"
    sg_rule_description = "http port"
    },
    {
      cidr_ipv4           = "136.226.250.163/32"
      from_port           = 80
      to_port             = 80
      ip_protocol         = "tcp"
      sg_rule_description = "http port"
  }]

}


variable "ingress_cidr_blocks_rds" {
  type = list(object({
    cidr_ipv4           = string
    from_port           = number
    to_port             = number
    ip_protocol         = string
    sg_rule_description = string
  }))

  default = [{
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 3306
    to_port             = 3306
    ip_protocol         = "tcp"
    sg_rule_description = "sql port"
    },
    {
      cidr_ipv4           = "136.226.250.163/32"
      from_port           = 3306
      to_port             = 3306
      ip_protocol         = "tcp"
      sg_rule_description = "sql port"
  }]

}

variable "ingress_cidr_blocks_alb" {
  type = list(object({
    cidr_ipv4           = string
    from_port           = number
    to_port             = number
    ip_protocol         = string
    sg_rule_description = string
  }))

  default = [{
    cidr_ipv4           = "0.0.0.0/0"
    from_port           = 8080
    to_port             = 8080
    ip_protocol         = "tcp"
    sg_rule_description = "http port"
    },
    {
      cidr_ipv4           = "10.0.0.0/16"
      from_port           = 8080
      to_port             = 8080
      ip_protocol         = "tcp"
      sg_rule_description = "http port"
  }]

}

variable "sg_name" {
  type        = string
  default     = "value"
  description = "value"
}
variable "ingress_port" {
  type        = number
  default     = 80
  description = "value"
}

variable "http_port" {
  type        = number
  default     = 80
  description = "value"
}
/* variable "source_ip_range" {
  type = string
  default = "value"
  description = "value"
} */
variable "outbound_ip_range" {
  type        = string
  default     = "value"
  description = "value"
}
variable "ssh_port" {
  type        = number
  default     = 22
  description = "value"
}
variable "mysql_port" {
  type        = number
  default     = 3306
  description = "value"
}
variable "ec2_tags" {
  type        = map(any)
  default     = { Name = "Webserver" }
  description = "value"
}
variable "ingress_protocol" {
  type        = string
  default     = "value"
  description = "value"
}
variable "egress_protocol" {
  type        = string
  default     = "value"
  description = "value"
}

# ALB Variables
variable "description" {
  type        = string
  default     = "value"
  description = "value"
}

#RDS Variables 

variable "allocated_storage" {
  type        = string
  default     = "value"
  description = "value"
}
variable "db_name" {
  type        = string
  default     = "value"
  description = "value"
}
variable "engine" {
  type        = string
  default     = "value"
  description = "value"
}
#variable "engine_version" {
/* type = string
  default = "value"
  description = "value"
  } */
variable "instance_class" {
  type        = string
  default     = "value"
  description = "value"
}
variable "username" {
  type        = string
  default     = "value"
  description = "value"
}
variable "password" {
  type        = string
  default     = "value"
  description = "value"
}
/* variable "parameter_group_name" {
  type = string
  default = "value"
  description = "value"
  } */



