variable "project_name" {
  type = string
}

variable "default_region" {
  type = string
}

variable "default_zone" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "database_collation" {
  type = string
}

variable "databases_names" {
  type = list(string)
}
