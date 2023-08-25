output "frontend_team" {
  description = "UI github team"
  value = github_team.frontend-team.name
}
output "backend_team" {
  description = "API github team"
  value = github_team.backend-team.name
}

output "api_repository" {
  description = "Api service github repository"
  value = github_repository.vox-smart-api.name
}
output "ui_repository" {
  description = "UI service github repository"
  value = github_repository.vox-smart-ui.name
}
output "sdk_repository" {
  description = "SDK service github repository"
  value = github_repository.vox-smart-sdk.name
}
