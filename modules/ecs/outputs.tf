output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}