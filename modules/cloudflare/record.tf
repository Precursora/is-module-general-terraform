# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = var.cloudflare_zone_id
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
}
