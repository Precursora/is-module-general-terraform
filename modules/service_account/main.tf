resource "google_service_account" "service_account" {
  project      = var.project_name
  account_id   = var.account_id
  display_name = var.account_name
}

resource "google_service_account_iam_binding" "service_account_iam_binding" {
  count               = length(var.roles)
  service_account_id  = google_service_account.service_account.name
  role                = var.roles[count.index]
  members             = ["serviceAccount:${google_service_account.service_account.id}"]
}
