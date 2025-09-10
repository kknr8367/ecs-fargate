output "ecs_cluster_id" {
  value = module.ecs.cluster_id
}

output "alb_dns_name" {
  value = module.alb.dns_name
}