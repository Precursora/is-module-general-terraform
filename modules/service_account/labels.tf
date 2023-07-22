locals {
  default_labels = {
    owner-email   = var.owner_email
    tech-email    = var.tech_email
    team-email    = var.team_email
    support-email = var.support_email
    product       = var.product
    channel       = var.channel
    repository    = var.repository
  }
}

variable "owner_email" {
  type = string
}

variable "tech_email" {
  type = string
}

variable "team_email" {
  type = string
}

variable "support_email" {
  type = string
}

variable "product" {
  type = string
}

variable "channel" {
  type = string
}

variable "repository" {
  type = string
}

variable "custom_labels" {
  type = map(any)
  default = {}
}
