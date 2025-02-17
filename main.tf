terraform {
  required_providers {
    uberspace = {
      source  = "uberspace-community/uberspace"
      version = "0.0.1-alpha.3"
    }
  }
}

module "app" {
  source = "./modules/app"

  binary_path = var.binary_path
  binary_hash = filesha256(var.binary_path)
  domain      = var.domain
  port        = var.port
  args        = var.args
  environment = var.environment
}