module "rds-service" {
   source                  = "./modules/infra"
   environment             = var.environment
   project                 = var.project
   region                  = var.region
}
 

 
