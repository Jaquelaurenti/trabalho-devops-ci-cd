provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "demo_cluster" {
  name = "demo-cluster"
}

resource "aws_ecs_task_definition" "demo_task_definition" {
  family                = "demo-task"
  container_definitions = <<DEFINITION
[
  {
    "name": "demo-container",
    "image": "trabalho-ci-cd",
    "cpu": 256,
    "memory": 512,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 0
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "demo_service" {
  name            = "demo-service"
  cluster         = aws_ecs_cluster.demo_cluster.id
  task_definition = aws_ecs_task_definition.demo_task_definition.arn
  desired_count   = 1

  network_configuration {
    subnets = ["subnet-07f009fc648ecaf86"]
    security_groups = ["sg-0c17c2b7f4eab8a9b"]
  }
}
