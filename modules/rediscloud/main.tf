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
