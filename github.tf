terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

//terraform {
//  backend "s3" {
//    bucket = "terraform-state-storage"
//    key    = "voxsmart/terraform.tfstate"
//    region = "eu-west-1"
//  }
//}
# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "yourterraformprofile"
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_personal_token
  owner = var.org_name
}

# Add a repository to API team
resource "github_team" "backend-team" {
  name        = "BackendTeam"
  description = "Backend team"
}

# Add a repository to API team
resource "github_team" "frontend-team" {
  name        = "FrontendTeam"
  description = "Frontend team"
}
# Create API repository
resource "github_repository" "vox-smart-api" {
  name        = "voxsmart-service-api"
  description = "VoxSmart service API repo"

  visibility = "private"
}
# Manage relationship between the API team and the repository
resource "github_team_repository" "vox-smart-api" {
  team_id    = github_team.backend-team.id
  repository = github_repository.vox-smart-api.name
  permission = "admin"
}

# Create UI repository
resource "github_repository" "vox-smart-ui" {
  name        = "voxsmart-service-ui"
  description = "VoxSmart service UI repo"

  visibility = "private"
}
# Manage relationship between the UI team and the repository
resource "github_team_repository" "vox-smart-ui" {
  team_id    = github_team.frontend-team.id
  repository = github_repository.vox-smart-ui.name
  permission = "admin"
}

# Create SDK repository
resource "github_repository" "vox-smart-sdk" {
  name        = "voxsmart-service-sdk"
  description = "VoxSmart service SDK repo"

  visibility = "public"
}

# Manage relationship between the SDK team and the repository
resource "github_team_repository" "vox-smart-sdk" {
  team_id    = github_team.backend-team.id
  repository = github_repository.vox-smart-sdk.name
  permission = "admin"
}
