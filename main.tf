module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  availability_zone = var.availability_zone
  private_subnets   = var.private_subnets
}
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "dynamoDB" {
  source     = "./modules/dynamoDB"
  Table_Name = "Lighting"
  Hash_Key   = var.Hash_Key
  Hash_Key_type = var.Hash_Key_type
}
module "Heating" {
  source     = "./modules/dynamoDB"
  Table_Name = "Heating"
  Hash_Key   = var.Hash_Key
  Hash_Key_type = var.Hash_Key_type
}
module "servers" {
  source             = "./modules/servers"
  instance_type      = var.instance_type
  public_subnets     = module.vpc.public_subnets_ids
  private_subnets    = module.vpc.private_subnets_ids
  security_group_ids = module.security.security_group_ids
}
