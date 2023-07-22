# Local variables
locals {
  job_body = jsonencode({
    settings : {
      "activationPolicy" : var.job_activation_policy
    }
  })
}

# Default provider
provider "google" {
  region  = var.default_region
  zone    = var.default_zone
  project = var.project_name
}

# Job creation
resource "google_cloud_scheduler_job" "instance_scheduler_job" {
  labels           = merge(local.default_labels, var.custom_labels)
  provider         = google
  name             = var.job_name
  description      = var.job_description
  schedule         = var.job_start_cron
  time_zone        = var.job_time_zone
  attempt_deadline = var.job_attempt_deadline
  region           = var.default_region
  paused           = var.job_paused

  retry_config {
    retry_count = 3
  }

  http_target {
    http_method = "PATCH"
    uri         = "https://sqladmin.googleapis.com/v1/projects/${var.project_name}/instances/${var.instance_name}"
    body        = base64encode(local.job_body)

    oauth_token {
      service_account_email = "${var.service_account}@${var.project_name}.iam.gserviceaccount.com"
    }
  }
}