variable "environment" {
  default     = ""
  description = "Environment for deployment"
}

variable "project" {
  default     = ""
  description = "Project, aka the application name"
}

variable "region" {
  default     = ""
  description = "AWS region for resources"
}

variable "platform_version" {
  default     = "1.4.0"
  description = "Platform version on which to run your service."
}
