variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  type = string
}

variable "default_region" {
  type = string
  default = "us-central1"
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
  default     = 0
}

variable "max_instances" {
  description = "The maximum number of instances for the Cloud Run service"
  type        = number
  default     = 2
}

variable "timeout" {
  description = "The timeout for the Cloud Run service"
  type        = string
  default     = "60s"
}

variable "execution_environment" {
  description = "The execution environment for the Cloud Run service"
  type        = string
  default     = "EXECUTION_ENVIRONMENT_GEN1"
}

variable "concurrency" {
  description = "The maximum number of requests that can be handled concurrently by a single instance"
  type        = number
  default     = 80
}

variable "cpu" {
  description = "The number of CPU cores allocated to the Cloud Run service"
  type        = number
}

variable "cpu_idle" {
  description = "Define whether the CPU should always be allocated"
  type        = bool
  default     = true
}

variable "startup_cpu_boost" {
  description = "Define whether to enable CPU throttling on container startup"
  type        = bool
  default     = true 
}

variable "memory" {
  description = "The amount of memory allocated to the Cloud Run service"
  type        = string
}

variable "secrets" {
  description = "A map of secret environment variables for the Cloud Run service"
  type        = map(string)
  default     = {}
}

variable "job" {
  type    = object({
    create       = bool
    max_retries  = optional(number, 0)
    task_timeout = optional(number, 180)
    command      = list(string)
    args         = list(string)
  })

  default = {
    create  = false
    command = [ "sh", "-c" ]
    args    = [ "echo \"Running tasks\"" ]
  }
}
