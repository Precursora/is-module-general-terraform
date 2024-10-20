# Redis database
resource "rediscloud_essentials_database" "database" {
  subscription_id     = var.subscription_id
  name                = var.database_name
  enable_default_user = true
  password            = resource.random_password.password.result

  data_persistence = "none"
  replication      = false

  alert {
    name  = "throughput-higher-than"
    value = var.throughput_usage_to_alert
  }

  tags = var.labels
}

# User random password
resource "random_password" "password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# SQL instance host secret creation
module "redis_host_secret" {
  source        = "../../gcp/secret"
  labels        = var.labels
  project_name  = var.project_name
  secret_name   = "${var.database_name}-redis-host"
  secret_value  = rediscloud_essentials_database.database.public_endpoint
}

# SQL user password secret creation
module "redis_password_secret" {
  source        = "../../gcp/secret"
  labels        = var.labels
  project_name  = var.project_name
  secret_name   = "${var.database_name}-redis-password"
  secret_value  = resource.random_password.password.result
}
