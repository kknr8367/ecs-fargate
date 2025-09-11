
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "ecs" {
  source = "./modules/ecs"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  alb_arn         = module.alb.alb_arn

}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  target_group_arn = module.ecs.target_group_arn
}

module "ecr" {
  source               = "./modules/ecr"
  name                 = "ecs-fargate-repo"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  tags = {
    Environment = "dev"
    Project     = "ecs-app"
  }
}
