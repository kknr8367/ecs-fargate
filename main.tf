
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
  
  task_definition = templatefile("${path.module}/task-definitions/patient-service.json", {
  execution_role_arn = aws_iam_role.ecs_execution_role.arn
})
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  target_group_arn = module.ecs.target_group_arn
}