# Validate if default labels exists
locals {
  valid_labels = {
    owner-email   = var.labels.owner_email
    tech-email    = var.labels.tech_email
    team-email    = var.labels.team_email
    support-email = var.labels.support_email
    product       = var.labels.product
    channel       = var.labels.channel
    repository    = var.labels.repository
  }
}

variable "labels" {
  type = map(any)
}
