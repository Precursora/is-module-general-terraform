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

variable "website_domain" {
  type = string
  nullable = true
  default = null
}

variable "website_subdomain" {
  type = string
  nullable = true
  default = null
}

variable "website_main_page_suffix" {
  type = string
  nullable = true
  default = null
}

variable "website_not_found_page" {
  type = string
  nullable = true
  default = null
}

variable "cloudflare_zone_id" {
  type = string
  nullable = true
  default = null
}

variable "cloudflare_provider_api_token" {
  type = string
  nullable = true
  default = null
}
