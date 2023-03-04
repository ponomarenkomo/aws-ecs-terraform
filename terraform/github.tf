provider "github" {
  token = var.github_token
}

data "github_actions_public_key" "example_public_key" {
  repository = "../ponomarenkomo/aws-ecs-terraform"
}

resource "github_actions_secret" "example_secret" {
  repository      = "../ponomarenkomo/aws-ecs-terraform"
  secret_name     = "ECR_REPOSITORY"
  plaintext_value = aws_ecr_repository.aws-ecr.name
}
