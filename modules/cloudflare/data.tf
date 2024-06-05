data "github_actions_secrets" "gh_secrets" {
  provider = github
  name = "is-module-general-deploy-actions"
}
