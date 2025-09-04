variable "name"          { type = string }
variable "vpc_id"        { type = string }
variable "db_subnet_ids" { type = list(string) }
variable "app_sg_id"     { type = string }

variable "db_username" { type = string }
variable "db_password" { 
    type = string
    sensitive = true 
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}
