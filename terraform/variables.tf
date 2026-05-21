variable "app_version" {
  description = "The version of the application"
  type        = string
}

variable "app_name" {
  description = "The application name"
  type        = string
}

variable "environment" {
  description = "The environment in which the instance is being deployed"
  type        = string
  default     = "dev"
}
