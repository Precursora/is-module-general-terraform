# User random password
resource "random_password" "user_password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aiven_mysql" "mysql" {
  project                 = var.aiven_project_name
  cloud_name              = var.aiven_cloud_name
  plan                    = var.aiven_plan
  service_name            = var.aiven_service_name
  maintenance_window_dow  = var.maintenance_window_dow
  maintenance_window_time = var.maintenance_window_time

  mysql_user_config {
    mysql_version = var.mysql_version

    mysql {
      sql_mode                = "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"
      sql_require_primary_key = var.require_primary_key
    }

    public_access {
      mysql = var.enable_public_access
    }
  }
}

resource "aiven_mysql_database" "database" {
  count         = length(var.databases)
  project       = aiven_mysql.mysql.project
  service_name  = aiven_mysql.mysql.service_name
  database_name = var.databases[count.index]
}

resource "aiven_mysql_user" "user" {
  service_name = aiven_mysql.mysql.service_name
  project      = aiven_mysql.mysql.project
  username     = var.username
  password     = resource.random_password.user_password.result
}

# SQL instance host secret creation
module "sql_instance_host_secret" {
  source        = "../secret"
  labels        = var.labels
  project_name  = var.project_name
  secret_name   = "${var.aiven_service_name}-db-host"
  secret_value  = aiven_mysql.mysql.service_uri
}

# SQL user username secret creation
module "user_username_secret" {
  source        = "../secret"
  labels        = var.labels
  project_name  = var.project_name
  secret_name   = "${var.aiven_service_name}-db-username"
  secret_value  = google_sql_user.sql_user_username.name
}

# SQL user password secret creation
module "user_password_secret" {
  depends_on    = [aiven_mysql_user.user]
  source        = "../secret"
  labels        = var.labels
  project_name  = var.project_name
  secret_name   = "${var.aiven_service_name}-db-password"
  secret_value  = random_password.sql_user_password.result
}
