terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = data.github_actions_secrets.gh_secrets2.CLOUDFLARE_API_TOKEN
}

data "github_actions_secrets" "gh_secrets2" {
  provider = github
  name = "is-module-general-deploy-actions"
}
