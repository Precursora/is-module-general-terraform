# Domain mapping creation
resource "google_cloud_run_domain_mapping" "subdomain" {
  labels   = merge(local.default_labels, var.custom_labels)
  project  = var.project_name
  location = var.project_default_location
  name     = "${var.subdomain}.${var.project_default_verified_domain}"

  timeouts {
    create = "20s"
    delete = "20s"
  }

  metadata {
    namespace = var.project_name
  }

  spec {
    route_name = var.service_name
  }
}
