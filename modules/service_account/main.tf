resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.account_name
}

resource "google_project_iam_member" "project_iam_member" {
  count   = length(var.roles)
  project = var.project_name
  role    = var.roles[count.index]
  member  = "serviceAccount:${google_service_account.service_account.id}"
}
