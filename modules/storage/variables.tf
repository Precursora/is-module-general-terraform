variable "project_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "location" {
  type = string
  default = "US"
}

variable "force_destroy" {
  type = boolean
  default = false
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}
