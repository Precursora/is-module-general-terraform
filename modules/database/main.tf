# Default provider
provider "google" {
  region  = var.default_region
  zone    = var.default_zone
  project = var.project_name
}

# SQL database creation
resource "google_sql_database" "sql_database" {
  count     = length(var.databases_names)
  provider  = google
  name      = var.databases_names[count.index]
  instance  = var.instance_name
  collation = var.database_collation
}
