resource "aws_ecs_cluster" "this" {
    name = var.aws_ecs_cluster_name
}

resource "aws_ecs_service" "Fargate-service" {
    name = "movieinfosite"
    cluster = aws_ecs_cluster.this.id
    task_definition = aws_ecs_cluster.this.arn
    desired_count = 1
    launch_type = "FARGATE"

    network_configuration {
        subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
        security_groups = [aws_security_group.security_group.id]
        assign_public_ip = true
    }
}
