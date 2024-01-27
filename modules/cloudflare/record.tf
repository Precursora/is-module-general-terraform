# Add a record to the domain
resource "cloudflare_record" "record" {
  count   = var.subdomain != null ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
  comment = var.record_comment
}
