# Random user password
module "random_password" {
  source = "../../password"
  length = 12
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
  password     = module.random_password.result
}

# SQL instance host secret creation
module "aiven_mysql_url_secret" {
  source         = "../../gcp/secret"
  labels         = var.labels
  project_name   = var.project_name
  default_region = var.default_region
  secret_name    = "${var.aiven_service_name}-url"
  secret_value   = "mysql://${aiven_mysql_user.user.username}:${aiven_mysql_user.user.password}@${aiven_mysql.mysql.service_host}:${aiven_mysql.mysql.service_port}"
}
