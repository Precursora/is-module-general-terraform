# Service account creation
resource "google_service_account" "service_account" {
  labels       = merge(local.default_labels, var.custom_labels)
  project      = var.project_name
  account_id   = var.account_id
  display_name = var.account_name
}

# Project IAM creation
resource "google_project_iam_member" "project_iam_member" {
  count   = length(var.roles)
  project = var.project_name
  role    = var.roles[count.index]
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
