terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = data.external.env_var.result["cloudflare_api_token"]
}

data "external" "env_var" {
  program = ["bash", "${path.root}/get_env_vars.sh"]
}
