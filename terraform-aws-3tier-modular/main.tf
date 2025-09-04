locals {
  name = "${var.project}-${var.env}"
}

module "vpc" {
  source = "./modules/vpc"

  name                = local.name
  cidr_block          = "10.0.0.0/16"
  azs                 = var.azs
  public_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  app_subnet_cidrs    = ["10.0.20.0/24", "10.0.21.0/24"]
  db_subnet_cidrs     = ["10.0.30.0/24", "10.0.31.0/24"]
}

module "alb" {
  source = "./modules/alb"

  name              = local.name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "asg" {
  source = "./modules/asg"

  name                = local.name
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.app_subnet_ids
  alb_sg_id           = module.alb.alb_sg_id
  target_group_arn    = module.alb.target_group_arn
  instance_type       = var.instance_type
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
}

module "rds" {
  source = "./modules/rds"

  name             = local.name
  vpc_id           = module.vpc.vpc_id
  db_subnet_ids    = module.vpc.db_subnet_ids
  db_username      = var.db_username
  db_password      = var.db_password
  app_sg_id        = module.asg.app_sg_id
}
