# Bucket creation
resource "google_storage_bucket" "bucket" {
  labels        = var.labels
  project       = var.project_name
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy
  storage_class = var.storage_class
}
