variable "subdomain" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_provider_api_token" {
  type = string
}

variable "record_type" {
  type = string
}

variable "record_value" {
  type = string
}

variable "record_comment" {
  type = string
  nullable = true
  default = null
}
