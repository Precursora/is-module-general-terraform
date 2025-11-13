# User random password
resource "random_password" "user_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aiven_valkey" "valkey" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud_name
  plan                    = var.aiven_plan
  service_name            = var.aiven_service_name
  maintenance_window_dow  = var.maintenance_window_dow
  maintenance_window_time = var.maintenance_window_time

  valkey_user_config {
    public_access {
      valkey = var.enable_public_access
    }
  }
}

resource "aiven_valkey_user" "user" {
  service_name = aiven_valkey.valkey.service_name
  project      = aiven_valkey.valkey.project
  username     = var.username
  password     = resource.random_password.user_password.result
}

# SQL instance host secret creation
module "aiven_valkey_host_secret" {
  source         = "../../gcp/secret"
  labels         = var.labels
  project_name   = var.project_name
  default_region = var.default_region
  secret_name    = "${var.aiven_service_name}-db-host"
  secret_value   = aiven_valkey.valkey.service_host
}

# SQL user username secret creation
module "aiven_valkey_user_secret" {
  source         = "../../gcp/secret"
  labels         = var.labels
  project_name   = var.project_name
  default_region = var.default_region
  secret_name    = "${var.aiven_service_name}-db-username"
  secret_value   = aiven_valkey_user.user.username
}

# SQL user password secret creation
module "aiven_valkey_password_secret" {
  source         = "../../gcp/secret"
  labels         = var.labels
  project_name   = var.project_name
  default_region = var.default_region
  secret_name    = "${var.aiven_service_name}-db-password"
  secret_value   = aiven_valkey_user.user.password
}
