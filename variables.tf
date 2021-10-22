#-----------------------------------------------------------
# REQUIRED PARAMETERS
#-----------------------------------------------------------

variable "suffix" {
    description     = "An arbitrary suffix that will hat will be added to the resource name(s).For example: an environment name, a business-case name, a numeric id, etc, "
    type            = string
    validation {
      condition     = length(var.suffix) <= 14
      error_message = "A max of 14 character(s) are allowed."


    }  
}

variable "db_instance_identifier" {
  type = string
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  default = "rds-demo-instance"
}

variable "username" {
  type  = string
  description = "Username for the master DB user"
  default = "rdsamdim4321"
}

variable "instance_class" {
  type = string
  description = "The instance type of the RDS instance"
  default = "db.m6g.large"
}

variable "allocated_storage" {
 type = string
 description = "The allocated storage in gigabytes" 
 default = "5"
}

variable "engine" {
 type = string
 description = "The database engine to use" 
 default = "postgres" 
}

variable "engine_version" {
 type = string
 description = "The engine version to use" 
 default = "13.3"
}

variable "db_subnet_group_name" {
 type = string
 description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC" 
 default = "rds-subnet-demo"
}

variable "vpc_security_group_ids" {
 type = list(string)
 description = "List of VPC security groups to associate" 
 default = ["sg-504f797c"]
}


variable "publicly_accessible" {
 type = bool
 description = "Bool to control if instance is publicly accessible" 
 default = "true"
}

variable "skip_final_snapshot" {
 type = bool
 description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier" 
 default = "true"
}

variable "region" {
 description = "value" 
 default = "us-east-1"
}

variable "multi_availability_zone" {
    type = bool
    description = "Availability Zone (AZ) to provide data redundancy, eliminate I/O freezes, and minimize latency spikes during system backups."
    default = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs used by database subnet group created"
  default = [ "subnet-1e10f978" , "subnet-05bb0348"]
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources for subnet group."
  default = {
    "dev" = "true"
  }
}

variable "subnet_name" {
  type          = string
  description   = "Name of the Subnet Group"
  default       = "subnet-test"
}

  variable "name" {
  type        = string
  description = "Name of the VPC"
  default     = "rds-vpc43"
}

variable "vpc_id" {}

variable "db_password" {
  type = string
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  default = "super_secret_password"
}

variable "master_username" {
  type = string
  description = "Username for the master DB user"
  default = "dbadmin21"
}

variable "parameter_group_name" {
 type = string
 description = "Name of the db parameter group to associate or create" 
 default = "defaultpostgres13"
}
