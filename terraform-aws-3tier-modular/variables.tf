variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "ec2tech"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "terraform-workshop"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "Availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "db_username" {
  type        = string
  description = "RDS master username"
  default     = "adminuser"
}

variable "db_password" {
  type        = string
  description = "RDS master password"
  sensitive   = true
  default     = "ChangeMe12345!"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  type        = number
  default     = 2
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "max_size" {
  type        = number
  default     = 3
}
