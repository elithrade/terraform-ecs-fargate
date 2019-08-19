# variables.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-southeast-2"
}

variable "company" {
  description = "The company to name to include, e.g. fugro, roames."
}

variable "environment" {
  description = "The environment under which this is run. e.g. prod, dev, uat."
}

variable "scope" {
  description = "The name of the project used for scoping deployment."
}

# Specify the provider and access details
provider "aws" {
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  region                  = "${var.aws_region}"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "EcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default     = "EcsAutoScaleRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "ecr_image_url"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
