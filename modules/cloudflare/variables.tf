variable "domain" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "cloudflare_provider_api_token" {
  type = string
  default = ""
}

variable "cloudflare_provider_zone_id_precursoracombr" {
  type = string
  default = ""
}

variable "cloudflare_provider_zone_id_felipemenezescombr" {
  type = string
  default = ""
}

variable "record_type" {
  type = string
}

variable "record_value" {
  type = string
}

variable "record_comment" {
  type = string
  default = ""
}
