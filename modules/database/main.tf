# Default provider
provider "google" {
  region  = var.default_region
  zone    = var.default_zone
  project = var.project_name
}

# SQL database creation
resource "google_sql_database" "sql_database" {
  provider  = google
  name      = var.database_name
  instance  = var.instance_name
  collation = var.database_collation
}
