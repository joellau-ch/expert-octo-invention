provider "aws" {
  region = "ap-southeast-1"
  default_tags {
    tags = {
      env     = "staging"
      team    = "trading-desk"
      project = "thales-dashboard"
      source  = "https://github.com/coinhako/infra/tree/main/thales-dashboard"
    }
  }
}
