# Add a record to the domain
resource "cloudflare_record" "record" {
  zone_id = cond(
              var.domain == "precursora.com.br",
              var.cloudflare_provider_zone_id_precursoracombr,
              cond(
                var.domain == "felipemenezes.com.br",
                var.cloudflare_provider_zone_id_felipemenezescombr
              )
            )
  name    = var.subdomain
  type    = var.record_type
  value   = var.record_value
  comment = var.record_comment
}
