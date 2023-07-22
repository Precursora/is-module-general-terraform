# SQL database creation
resource "google_sql_database" "sql_database" {
  labels    = var.labels
  name      = var.database_name
  instance  = var.instance_name
  collation = var.database_collation
}
