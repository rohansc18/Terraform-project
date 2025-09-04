resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnetgrp"
  subnet_ids = var.db_subnet_ids
  tags = { Name = "${var.name}-db-subnetgrp" }
}

resource "aws_security_group" "db" {
  name   = lower("${var.name}-db-subnetgrp")
  vpc_id = var.vpc_id

  ingress {
    description     = "MySQL from App SG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name}-db-sg" }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.name}-mysql"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_name                 = "appdb"
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  apply_immediately       = true
  vpc_security_group_ids  = [aws_security_group.db.id]
  db_subnet_group_name    = aws_db_subnet_group.this.name
  publicly_accessible     = false
  deletion_protection     = false
  auto_minor_version_upgrade = true

  tags = { Name = "${var.name}-mysql" }
}
