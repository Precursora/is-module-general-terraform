terraform {
  required_providers {
    aiven = {
      source = "aiven/aiven"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

provider "aiven" {
  api_token = data.external.env_var.result["aiven_provider_api_token"]
}

data "external" "env_var" {
  program = ["bash", "${path.root}/get_env_vars.sh"]
}
