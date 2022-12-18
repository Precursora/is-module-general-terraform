# Secret creation
resource "google_secret_manager_secret" "secret" {
  project   = var.project_name
  secret_id = var.secret_name

  replication {
    automatic = true
  }
}

# Secret version creation
resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_value
}