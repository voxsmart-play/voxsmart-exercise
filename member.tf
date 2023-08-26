# Add a user to the organization
resource "github_membership" "membership_for_backend_user" {
  username = "BackendUser"
  role     = "member"
}

resource "github_membership" "membership_for_frontend_user" {
  username = "FrontendUser" #This should be an existing github user
  role     = "member"
}

resource "github_team_members" "backend_team_members" {
  team_id  = github_team.backend-team.id

  members {
    username = "BackendUser" #This should be an existing github user
    role     = "maintainer"
  }

}

resource "github_team_members" "frontend_team_members" {
  team_id  = github_team.frontend-team.id

  members {
    username = "FrontendUser"
    role     = "maintainer"
  }

}