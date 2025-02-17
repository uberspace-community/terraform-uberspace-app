terraform {
  required_providers {
    uberspace = {
      source  = "uberspace-community/uberspace"
      version = "0.0.1-alpha.2"
    }
  }
}

data "uberspace_user" "user" {}

resource "uberspace_remote_file" "app" {
  src        = var.binary_path
  dst        = "/home/${data.uberspace_user.user.name}/bin/${var.domain}"
  src_hash   = var.binary_hash
  executable = true
}

locals {
  path    = "/home/${data.uberspace_user.user.name}/bin/${var.domain}"
  command = var.args != "" ? "${local.path} ${var.args}" : local.path
}

resource "uberspace_supervisor_service" "app" {
  name        = var.domain
  command     = local.command
  environment = var.environment

  lifecycle {
    replace_triggered_by = [
      uberspace_remote_file.app
    ]
  }
}

resource "uberspace_web_domain" "app" {
  domain = var.domain
}

resource "uberspace_web_backend" "app" {
  depends_on = [uberspace_web_domain.app, uberspace_remote_file.app]

  uri  = "${var.domain}/"
  port = var.port
}
