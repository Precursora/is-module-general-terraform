variable "project_name" {
  type = string
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

variable "mysql_version" {
  type = string
  default = "8"
}

variable "require_primary_key" {
  type = bool
  default = false
}

variable "enable_public_access" {
  type = bool
  default = true
}

variable "databases" {
  type = list(string)
}

variable "username" {
  type = string
  default = "dbuser"
}
