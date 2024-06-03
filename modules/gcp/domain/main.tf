# Domain mapping creation
resource "google_cloud_run_domain_mapping" "subdomain" {
  project  = var.project_name
  location = var.default_region
  name     = "${var.subdomain}.${var.domain}"

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
  source = "../../cloudflare"
  domain = var.domain
  subdomain = var.subdomain
  record_value = "ghs.googlehosted.com"
  record_type = "CNAME"
  record_comment = "Projeto: ${var.project_name} | Serviço: CloudRun"
}
