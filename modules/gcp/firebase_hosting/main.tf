# Site creation
resource "google_firebase_hosting_site" "default" {
  project = var.project_name
  site_id = var.website_name
}

# Custom domain creation
resource "google_firebase_hosting_custom_domain" "default" {
  project = var.project_name
  site_id = google_firebase_hosting_site.default.site_id
  custom_domain = "${var.website_subdomain}.${var.website_domain}"
}

# Cloudflare DNS record to website subdomain
module "cname_dns_record" {
  source                        = "../../cloudflare"
  subdomain                     = var.website_subdomain
  record_value                  = "${google_firebase_hosting_site.default.site_id}.web.app"
  record_type                   = "CNAME"
  record_comment                = "Projeto: ${var.project_name} | Serviço: Firebase Hosting"
  cloudflare_zone_id            = var.cloudflare_zone_id
  cloudflare_provider_api_token = var.cloudflare_provider_api_token
}
