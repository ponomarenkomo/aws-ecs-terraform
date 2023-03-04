resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-${var.app_environment}-ecs"
}

resource "aws_ecr_repository" "aws-ecr" {
  name = "${var.app_name}-${var.app_environment}-ecr"
  tags = {
    Name        = "${var.app_name}-ecr"
    Environment = var.app_environment
  }
}

resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-${var.app_environment}-logs"

  tags = {
    Application = var.app_name
    Environment = var.app_environment
  }
}

# data "template_file" "testapp" {
#   template = file("./templates/image/image.json")

#   vars = {
#     app_image                = var.app_image
#     app_port                 = var.app_port
#     fargate_cpu              = var.fargate_cpu
#     fargate_memory           = var.fargate_memory
#     aws_region               = var.aws_region
#     app_name                 = var.app_name
#     app_environment          = var.app_environment
#     aws_cloudwatch_log_group = aws_cloudwatch_log_group.log-group.id
#   }
# }

# resource "aws_ecs_task_definition" "aws-ecs-task" {
#   family = "${var.app_name}-task"

#   container_definitions = templatefile("./templates/image/image.json", {
#     app_image                = var.app_image
#     app_port                 = var.app_port
#     fargate_cpu              = var.fargate_cpu
#     fargate_memory           = var.fargate_memory
#     aws_region               = var.aws_region
#     app_name                 = var.app_name
#     app_environment          = var.app_environment
#     aws_cloudwatch_log_group = aws_cloudwatch_log_group.log-group.id
#   })

#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
#   task_role_arn            = aws_iam_role.ecsTaskExecutionRole.arn

#   tags = {
#     Name        = "${var.app_name}-ecs-td"
#     Environment = var.app_environment
#   }
# }

# data "aws_ecs_task_definition" "main" {
#   task_definition = aws_ecs_task_definition.aws-ecs-task.family
# }
