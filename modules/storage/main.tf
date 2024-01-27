# Bucket creation
resource "google_storage_bucket" "bucket" {
  count         = var.is_website_bucket ? 0 : 1
  labels        = var.labels
  project       = var.project_name
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy
  storage_class = var.storage_class
}

# Website bucket creation
resource "google_storage_bucket" "website_bucket" {
  count         = var.is_website_bucket ? 1 : 0
  labels        = var.labels
  project       = var.project_name
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy
  storage_class = var.storage_class

  website {
    main_page_suffix = var.website_main_page_suffix
    not_found_page   = var.website_not_found_page
  }
}

# Access 
resource "google_storage_bucket_iam_member" "member" {
  depends_on = [google_storage_bucket.website_bucket]
  bucket     = google_storage_bucket.website_bucket.name
  role       = "roles/storage.objectViewer"
  member     = "allUsers"
}

module "cname_dns_record" {
  source                        = "../cloudflare"
  subdomain                     = var.subdomain
  record_value                  = "c.storage.googleapis.com"
  record_type                   = "CNAME"
  record_comment                = "Bucket GCS: ${google_storage_bucket.website_bucket.name}"
  cloudflare_zone_id            = var.cloudflare_zone_id
  cloudflare_provider_api_token = var.cloudflare_provider_api_token
}
