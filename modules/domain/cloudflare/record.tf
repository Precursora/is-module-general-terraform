# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = var.cloudflare_zone_id
  name    = var.subdomain
  value   = "ghs.googlehosted.com"
  type    = "CNAME"
}
