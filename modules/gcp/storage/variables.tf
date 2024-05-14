variable "project_name" {
  type = string
}

variable "bucket_name" {
  type = string
  nullable = true
  default = null
}

variable "location" {
  type = string
  default = "US"
}

variable "force_destroy" {
  type = bool
  default = false
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}
