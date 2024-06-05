terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = "uYSkUR4ZdPg0aWw0cHR2dsJ9I7XnLVVyKJEmTZB_"
}
