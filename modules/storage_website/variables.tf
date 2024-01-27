variable "project_name" {
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

variable "website_domain" {
  type = string
}

variable "website_subdomain" {
  type = string
}

variable "website_main_page_suffix" {
  type = string
}

variable "website_not_found_page" {
  type = string
  default = "404.html"
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_provider_api_token" {
  type = string
}
