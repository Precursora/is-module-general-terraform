variable "project_name" {
  type = string
}

variable "default_region" {
  type = string
  default = "us-central1"
}

variable "environment" {
  type = string
}

variable "project_default_verified_domain" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "service_name" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_provider_api_token" {
  type = string
}
