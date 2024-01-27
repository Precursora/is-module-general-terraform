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
  type = bool
  default = false
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}

variable "is_website_bucket" {
  type = bool
  default = false
}

variable "website_main_page_suffix" {
  type = string
  default = "index.html"
}

variable "website_not_found_page" {
  type = string
  default = null
}

variable "subdomain" {
  type = string
  default = null
}

variable "cloudflare_zone_id" {
  type = string
  default = null
}

variable "cloudflare_provider_api_token" {
  type = string
  default = null
}
