module "network" {

  source = "./modules/network"

  project_name   = var.project_name
  env            = var.env
  region         = var.region
  vpc_cidr       = var.vpc_cidr

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

}
