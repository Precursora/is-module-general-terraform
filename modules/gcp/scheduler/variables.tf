variable "project_name" {
  type = string
}

variable "service_account" {
  type = string
}

variable "default_region" {
  type = string
  default = "us-central1"
}

variable "default_zone" {
  type = string
  default = "us-central1-a"
}

variable "job_enable_creation" {
  type = bool
  default = true
}

variable "job_http_method" {
  type = string
}

variable "job_uri" {
  type = string
}

variable "job_name" {
  type = string
}

variable "job_description" {
  type = string
}

variable "job_activation_policy" {
  type = string
}

variable "job_start_cron" {
  type = string
}

variable "job_time_zone" {
  type = string
}

variable "job_attempt_deadline" {
  type = string
}

variable "job_paused" {
  type = bool
}
