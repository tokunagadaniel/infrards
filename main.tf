module "db" {
  source = "./modules/infra/mysql-db"

  identifier = var.environment

  name     = var.db_name
  username = var.db_user
  password = var.db_pass
  port     = 3306
}