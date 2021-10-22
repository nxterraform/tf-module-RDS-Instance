terraform {
  required_version =">= 1.0.9" # see https://releases.hashicorp.com/terraform/
}

locals {
  db_instance_identifier = format("%s-%s" , var.db_instance_identifier, var.suffix)  
}


  #create RDS Instances
  module "rds" {
  source                 =  "./moddules/postgres/"

  identifier             = local.db_instance_identifier
  instance_class         = var.instance_class

  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  
  username               = var.master_username
  password               = var.db_password

  db_subnet_group_name   = var.db_subnet_group_name

  vpc_security_group_ids = var.vpc_security_group_ids
  parameter_group_name   = var.parameter_group_name
  publicly_accessible    = var.publicly_accessible

  skip_final_snapshot    = var.skip_final_snapshot

   multi_az              = var.multi_availability_zone
}


