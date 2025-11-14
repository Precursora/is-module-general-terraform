output "plan" {
  value = data.rediscloud_essentials_plan.plan.id
}

output "subscription" {
  value = rediscloud_essentials_subscription.subscription.id
}
