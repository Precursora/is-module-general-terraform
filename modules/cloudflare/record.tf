# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = data.github_actions_secrets.gh_secrets.secrets.CLOUDFLARE_ZONE_ID_PRECURSORACOMBR
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
  comment = var.record_comment
}
