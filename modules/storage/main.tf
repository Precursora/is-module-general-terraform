# Bucket creation
resource "google_storage_bucket" "bucket" {
  count         = var.website_domain != null ? 0 : 1
  labels        = var.labels
  project       = var.project_name
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy
  storage_class = var.storage_class
}

# Website bucket creation
resource "google_storage_bucket" "website_bucket" {
  count         = var.website_domain != null ? 1 : 0
  labels        = var.labels
  project       = var.project_name
  name          = "${var.website_subdomain}.${var.website_domain}"
  location      = var.location
  force_destroy = var.force_destroy
  storage_class = var.storage_class

  website {
    main_page_suffix = var.website_main_page_suffix
    not_found_page   = var.website_not_found_page
  }
}

# Public access permition to website bucket
resource "google_storage_bucket_iam_member" "member" {
  depends_on = [google_storage_bucket.website_bucket[0]]
  bucket     = google_storage_bucket.website_bucket[0].name
  role       = "roles/storage.objectViewer"
  member     = "allUsers"
}

# Cloudflare DNS record to website bucket subdomain
module "cname_dns_record" {
  source                        = "../cloudflare"
  subdomain                     = var.website_subdomain
  record_value                  = "c.storage.googleapis.com"
  record_type                   = "CNAME"
  record_comment                = "Bucket GCS: ${google_storage_bucket.website_bucket[0].name}"
  cloudflare_zone_id            = var.cloudflare_zone_id
  cloudflare_provider_api_token = var.cloudflare_provider_api_token
}
