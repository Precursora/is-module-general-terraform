# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = data.github_actions_secrets.gh_secrets[var.domain == "precursora.com.br" ? "CLOUDFLARE_ZONE_ID_PRECURSORACOMBR" : (var.domain == "felipemenezes.com.br" ? "CLOUDFLARE_ZONE_ID_FELIPEMENEZESCOMBR" : "")]
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
  comment = var.record_comment
}
