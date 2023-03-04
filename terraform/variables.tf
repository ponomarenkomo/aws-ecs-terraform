
variable "ecs_public_subnets" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24"]
}

variable "ecs_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "app_name" {
  type    = string
  default = "nipo-app"
}

variable "app_environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "fargate_cpu" {
  default = 256
  type    = number
}

variable "fargate_memory" {
  default = 512
  type    = number
}

variable "app_image" {
  description = "docker image to run in this ECS cluster"
}

variable "app_port" {
  default     = "8080"
  description = "portexposed on the docker image"
}

variable "github_token" {
  type      = string
  sensitive = true
}
