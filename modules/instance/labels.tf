# Validate if default labels exists
locals {
  valid_labels = {
    owner-email      = var.labels.owner-email
    tech-email       = var.labels.tech-email
    team-name        = var.labels.team-name
    team-email       = var.labels.team-email
    support-email    = var.labels.support-email
    maintenance-code = var.labels.maintenance-code
    product-name     = var.labels.product-name
    repository       = var.labels.repository
  }
}

variable "labels" {
  type = map(any)
}
