# User random password
resource "random_password" "sql_user_password" {
  labels           = merge(local.default_labels, var.custom_labels)
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# SQL user creation
resource "google_sql_user" "sql_user_username" {
  labels    = merge(local.default_labels, var.custom_labels)
  name      = var.instance_username
  instance  = var.instance_name
  password  = random_password.sql_user_password.result
}

# SQL user username secret creation
module "user_username_secret" {
  source        = "../secret"
  project_name  = var.project_name
  secret_name   = "${var.secret_name}-db-username"
  secret_value  = google_sql_user.sql_user_username.name

  owner_email   = var.owner_email
  tech_email    = var.tech_email
  team_email    = var.team_email
  support_email = var.support_email
  product       = var.product
  channel       = var.channel
  repository    = var.repository
  custom_labels = var.custom_labels
}

# SQL user password secret creation
module "user_password_secret" {
  depends_on    = [google_sql_user.sql_user_username]
  source        = "../secret"
  project_name  = var.project_name
  secret_name   = "${var.secret_name}-db-password"
  secret_value  = random_password.sql_user_password.result

  owner_email   = var.owner_email
  tech_email    = var.tech_email
  team_email    = var.team_email
  support_email = var.support_email
  product       = var.product
  channel       = var.channel
  repository    = var.repository
  custom_labels = var.custom_labels
}
