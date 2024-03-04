module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnets = var.public_subnets
  availability_zone = var.availability_zone
  private_subnets = var.private_subnets
}