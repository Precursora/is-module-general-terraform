variable "project_name" {
  type = string
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
