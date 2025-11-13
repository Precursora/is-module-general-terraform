variable "project_name" {
  type = string
}

variable "default_region" {
  type    = string
  default = "us-central1"
}

variable "aiven_project_name" {
  type = string
}

variable "aiven_cloud_name" {
  type = string
}

variable "aiven_plan" {
  type = string
}

variable "aiven_service_name" {
  type = string
}

variable "maintenance_window_dow" {
  type = string
  default = "monday"
}

variable "maintenance_window_time" {
  type = string
  default = "10:00:00"
}

variable "enable_public_access" {
  type = bool
  default = true
}

variable "username" {
  type = string
  default = "dbuser"
}
