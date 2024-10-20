terraform {
  required_providers {
    rediscloud = {
      source = "RedisLabs/rediscloud"
      version = "1.9.0"
    }
  }
}

provider "rediscloud" {
  api_key = data.external.env_var.result["rediscloud_api_key"]
  secret_key = data.external.env_var.result["rediscloud_secret_key"]
}

data "external" "env_var" {
  program = ["bash", "${path.root}/get_env_vars.sh"]
}
