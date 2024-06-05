# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = var.domain == "precursora.com.br" ? "359cbc9a1eb5969fb86bcd4428cecbc3" : (var.domain == "felipemenezes.com.br" ? "6e27a9876f601a14bb4cccc9450a1b9c" : "")
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
  comment = var.record_comment
}
