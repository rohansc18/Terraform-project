variable "name"               { type = string }
variable "vpc_id"             { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "alb_sg_id"          { type = string }
variable "target_group_arn"   { type = string }

variable "instance_type"    { type = string }
variable "desired_capacity" { type = number }
variable "min_size"         { type = number }
variable "max_size"         { type = number }

variable "key_name" {
  description = "Optional key pair to SSH into instances"
  type        = string
  default     = null
}
