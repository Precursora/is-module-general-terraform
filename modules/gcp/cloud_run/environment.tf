# List environment variables
locals {
  env_file = file("../app/environments/${upper(var.environment)}.env")
  env_vars = (
    trimspace(local.env_file) == "" ? {} :
    yamldecode(local.env_file)
  )
}

# Load pipeline environment variables
data "external" "env_var" {
  program = ["bash", "${path.root}/get_env_vars.sh"]
}
