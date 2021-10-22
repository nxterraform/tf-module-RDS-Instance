resource "rds_db_instance" "db" {
  identifier             = local.db_instance_identifier
  instance_class         = var.instance_class

  allocated_storage      = var.allocated_storage
  engine                 = var.engine_type
  engine_version         = var.engine_version
  username               = var.master_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_name.db_sub_gr.id

  vpc_security_group_ids = ["${aws_vpc_security_group.rds_security_group.id}"]
  parameter_group_name   = var.parameter_group_name

  publicly_accessible    = var.publicly_accessible

  skip_final_snapshot    = var.skip_final_snapshot

   multi_az              = var.multi_availability_zone
}

resource "aws_db_subnet_name" "db_sub_gr" {
  description            = "terrafom db subnet group"
  name                   = var.subnet_name
  subnet_ids             = var.subnet_ids
  
  tags = var.tags
}


resource "aws_vpc_security_group" "rds_security_group" {
  name        	= "${var.name}-rds-sg"
  vpc_id	    = var.vpc_id
  description   = "RDS Security Group"
}
