# Domain mapping creation
resource "google_cloud_run_domain_mapping" "subdomain" {
  project  = var.project_name
  location = var.project_default_location
  name     = "${var.subdomain}.${var.project_default_verified_domain}"

  timeouts {
    create = "20s"
    delete = "20s"
  }

  metadata {
    labels = var.labels
    namespace = var.project_name
  }

  spec {
    route_name = var.service_name
  }
}

module "cname_dns_record" {
  source = "./cloudflare"
  subdomain = var.subdomain
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_provider_api_token = var.cloudflare_provider_api_token
}
