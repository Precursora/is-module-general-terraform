variable "project_name" {
  description = "Project name to deploy CloudRun service"
  type        = string
}

variable "default_region" {
  description = "Region to deploy CloudRun service"
  type        = string
  default     = "us-central1"
}

variable "service_account" {
  description = "The email of the service account to be used by Cloud Run"
  type        = string
}

variable "port" {
  description = "Application service port"
  type        = number
}

variable "ingress" {
  description = "The ingress settings for the Cloud Run service"
  type        = string
  default     = "INGRESS_TRAFFIC_ALL"
}

variable "min_instances" {
  description = "The minimum number of instances for the Cloud Run service"
  type        = number
}

variable "max_instances" {
  description = "The maximum number of instances for the Cloud Run service"
  type        = number
}

variable "timeout" {
  description = "The timeout for the Cloud Run service"
  type        = string
}

variable "execution_environment" {
  description = "The execution environment for the Cloud Run service"
  type        = string
}

variable "concurrency" {
  description = "The maximum number of requests that can be handled concurrently by a single instance"
  type        = number
}

variable "cpu" {
  description = "The number of CPU cores allocated to the Cloud Run service"
  type        = number
}

variable "cpu_idle" {
  description = "Define whether the CPU is only allocated during requests"
  type        = bool
}

variable "startup_cpu_boost" {
  description = "Define whether to enable CPU throttling on container startup"
  type        = bool
}

variable "memory" {
  description = "The amount of memory allocated to the Cloud Run service"
  type        = string
}

variable "env_file" {
  description = "Environment variables file to load"
  type        = string
}

variable "secrets" {
  description = "A map of secret environment variables for the Cloud Run service"
  type        = map(string)
}

variable "job" {
  description = "CloudRun job configuration"
  type        = object({
    create       = bool
    max_retries  = number
    task_timeout = string
    command      = list(string)
    args         = list(string)
  })
}
