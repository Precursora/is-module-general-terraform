# Validate if default labels exists
locals {
  valid_labels = {
    owner-name          = var.labels.owner-name
    tech-name           = var.labels.tech-name
    team-name           = var.labels.team-name
    maintenance-code    = var.labels.maintenance-code
    product-name        = var.labels.product-name
    repository-platform = var.labels.repository-platform
    repository-org      = var.labels.repository-org
    repository-name     = var.labels.repository-name
  }
}

variable "labels" {
  type = map(any)
}
