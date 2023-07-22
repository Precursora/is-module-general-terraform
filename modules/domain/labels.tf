# Validate if default labels exists
locals {
  valid_labels = {
    owner-email   = var.labels.owner-email
    tech-email    = var.labels.tech-email
    team-email    = var.labels.team-email
    support-email = var.labels.support-email
    product       = var.labels.product
    channel       = var.labels.channel
    repository    = var.labels.repository
  }
}

variable "labels" {
  type = map(any)
}
