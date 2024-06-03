# Site creation
resource "google_firebase_hosting_site" "default" {
  provider = google-beta
  project  = var.project_name
  site_id  = var.website_name
}

# Custom domain creation
resource "google_firebase_hosting_custom_domain" "default" {
  provider      = google-beta
  project       = var.project_name
  site_id       = google_firebase_hosting_site.default.site_id
  custom_domain = "${var.website_subdomain}.${var.website_domain}"
}

# Cloudflare DNS record to website subdomain
module "cname_dns_record" {
  source         = "../../cloudflare"
  domain         = var.website_domain
  subdomain      = var.website_subdomain
  record_value   = "${google_firebase_hosting_site.default.site_id}.web.app"
  record_type    = "CNAME"
  record_comment = "Projeto: ${var.project_name} | Serviço: Firebase Hosting"
}
