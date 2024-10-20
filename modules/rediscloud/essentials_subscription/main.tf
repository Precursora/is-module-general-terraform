data "rediscloud_essentials_plan" "plan" {
  name           = var.plan_name
  cloud_provider = var.plan_cloud_provider
  region         = var.plan_region
}

resource "rediscloud_essentials_subscription" "subscription" {
  name    = var.subscription_name
  plan_id = data.rediscloud_essentials_plan.plan.id
}
