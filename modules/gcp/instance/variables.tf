variable "project_name" {
  type = string
}

variable "service_account" {
  type = string
  default = "default-sql-scheduler"
}

variable "vpc_id" {
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

variable "instance_name" {
  type = string
}

variable "instance_username" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_disk_type" {
  type = string
}

variable "instance_disk_size" {
  type = string
}

variable "instance_disk_autoresize" {
  type = bool
}

variable "instance_availability_type" {
  type = string
}

variable "instance_deletion_protection_enabled" {
  type = bool
}

variable "instance_public_ip_enabled" {
  type = bool
}

variable "instance_private_ip_enabled" {
  type = bool
}

variable "database_version" {
  type = string
}

variable "database_collation" {
  type = string
}

variable "database_backup_enabled" {
  type = bool
}

variable "database_backup_start_time" {
  type = string
}

variable "database_backup_binary_log_enabled" {
  type = string
}

variable "databases_names" {
  type = list(string)
}

variable "instance_jobs_enable_creation" {
  type = bool
  default = true
}

variable "instance_job_time_zone" {
  type = string
  default = "America/Belem"
}

variable "instance_job_attempt_deadline" {
  type = string
  default = "90s"
}

variable "instance_job_start_event_cron" {
  type = string
  default = "0 7 * * 1-5" # At 07:00 AM, Monday through Friday
}

variable "instance_job_start_event_paused" {
  type = bool
  default = false
}

variable "instance_job_stop_event_cron" {
  type = string
  default = "30 19 * * *" # At 19:30 PM
}

variable "instance_job_stop_event_paused" {
  type = bool
  default = false
}
