variable "project_name" {
  type = string
}

variable "default_region" {
  type    = string
  default = "us-central1"
}

variable "recaptcha_name" {
  type = string
}

variable "recaptcha_allowed_domains" {
  type = list(string)
}
