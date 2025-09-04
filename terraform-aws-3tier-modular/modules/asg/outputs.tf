output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "app_sg_id" {
  value = aws_security_group.app.id
}

output "launch_template_id" {
  value = aws_launch_template.lt.id
}
