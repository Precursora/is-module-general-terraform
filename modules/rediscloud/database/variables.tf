variable "project_name" {
  type = string
}

variable "default_region" {
  type    = string
  default = "us-central1"
}

variable "subscription_id" {
  type = string
}

variable "database_name" {
  type = string
}

variable "throughput_usage_to_alert" {
  type = number
  default = 80
}
