data "aws_vpc" "default" {
  default = true
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = var.identifier

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.micro"
  allocated_storage = 10

  name     = var.name
  username = var.username
  password = var.password
  port     = var.port

  maintenance_window = "Fri:20:00-Fri:21:00"
  backup_window      = "22:00-23:00"

  backup_retention_period = 0

  # DB subnet group
  create_db_subnet_group = false
  db_subnet_group_name   = aws_db_subnet_group.db.name

  # DB Security group
  vpc_security_group_ids = [aws_security_group.db.id]

  # DB parameter group
  create_db_parameter_group = false
  parameter_group_name      = "default.mysql5.7"

  # DB option group
  create_db_option_group = false
  option_group_name      = "default:mysql-5-7"
}

provider "mysql" {
  endpoint = db.endpoint
  username = "app-user"
  password = "app-password"
}

resource "mysql_database" "app" {
  name = "another_db"
}

resource "aws_db_subnet_group" "db" {
  subnet_ids = ["subnet-0d808f444bb2174f3", "subnet-031ac19c8c68cd6e5", "subnet-0aff4fb0f3141b3c9"]

  tags = {
    Name = "Education"
  }
}

resource "aws_security_group" "db" {
  name = "db-sg-${var.identifier}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.db.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}