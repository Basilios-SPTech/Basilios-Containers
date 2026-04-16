module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
  my_ip  = var.my_ip
}

module "compute" {
  source = "./modules/compute"

  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  nginx_sg = module.security.nginx_sg
  app_sg   = module.security.app_sg

  key_name = var.key_name
}
