# CloudRun service creation
resource "google_cloud_run_v2_service" "default" {
  name                = "${data.external.env_var.result.service_name}"
  location            = var.default_region
  ingress             = var.ingress
  labels              = var.labels
  deletion_protection = false

  scaling {
    min_instance_count = var.min_instances
    max_instance_count = var.max_instances
  }

  template {
    service_account                  = "${var.service_account}@${var.project_name}.iam.gserviceaccount.com"
    timeout                          = var.timeout
    execution_environment            = var.execution_environment
    max_instance_request_concurrency = var.concurrency

    containers {
      image = data.external.env_var.result.image

      dynamic "env" {
        for_each = var.secrets
        content {
          name = upper(env.key)
          value_source {
            secret_key_ref {
              secret  = "projects/${data.external.env_var.result.project_number}/secrets/${env.value}"
              version = "latest"
            }
          }
        }
      }

      dynamic "env" {
        for_each = local.env_vars
        content {
          name  = env.key
          value = env.value
        }
      }

      resources {
        cpu_idle          = var.cpu_idle
        startup_cpu_boost = var.startup_cpu_boost

        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
      }

      ports {
        container_port = var.port
      }
    }
  }
}

# CloudRun job creation
resource "google_cloud_run_v2_job" "default" {
  count               = var.job.create ? 1 : 0
  depends_on          = [google_cloud_run_v2_service.default]
  name                = google_cloud_run_v2_service.default.name
  location            = google_cloud_run_v2_service.default.location
  labels              = var.labels
  deletion_protection = google_cloud_run_v2_service.default.deletion_protection

  template {
    template {
      service_account = "${var.service_account}@${var.project_name}.iam.gserviceaccount.com"
      max_retries     = var.job.max_retries
      timeout         = var.job.task_timeout

      containers {
        command = var.job.command
        args    = var.job.args
        image   = data.external.env_var.result.image

        dynamic "env" {
          for_each = var.secrets
          content {
            name = upper(env.key)
            value_source {
              secret_key_ref {
                secret  = "projects/${data.external.env_var.result.project_number}/secrets/${env.value}"
                version = "latest"
              }
            }
          }
        }

        dynamic "env" {
          for_each = local.env_vars
          content {
            name  = env.key
            value = env.value
          }
        }
      }
    }
  }
}

# CloudRun member creation
resource "google_cloud_run_v2_service_iam_member" "no_auth" {
  location = var.default_region
  name     = google_cloud_run_v2_service.default.name
  role   = "roles/run.invoker"
  member = "allUsers"
}
