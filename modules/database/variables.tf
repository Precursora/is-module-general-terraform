variable "project_name" {
  type = string
}

variable "default_region" {
  type    = string
  default = "us-east1"
}

variable "default_zone" {
  type    = string
  default = "us-east1-a"
}

variable "instance_name" {
  type = string
}

variable "database_collation" {
  type = string
}

variable "database_name" {
  type = string
}
