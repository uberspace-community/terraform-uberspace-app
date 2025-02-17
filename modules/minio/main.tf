terraform {
  required_providers {
    uberspace = {
      source  = "uberspace-community/uberspace"
      version = "0.0.1-alpha.3"
    }
  }
}

data "http" "minio" {
  url = "https://dl.min.io/server/minio/release/linux-amd64/minio.sha256sum"
}

data "uberspace_user" "user" {}

module "minio_app" {
  source = "../app"

  binary_path = "https://dl.min.io/server/minio/release/linux-amd64/minio"
  binary_hash = data.http.minio.response_body
  domain      = var.domain
  port        = var.port
  args        = "server /home/${data.uberspace_user.user.name}/minio --address 0.0.0.0:${var.port} --console-address 0.0.0.0:${var.console_port}"
  environment = {
    "MINIO_ACCESS_KEY"           = var.minio_access_key
    "MINIO_SECRET_KEY"           = var.minio_secret_key
    "MINIO_BROWSER_REDIRECT_URL" = "https://${var.console_domain}/"
  }
}

resource "uberspace_web_domain" "minio_console" {
  depends_on = [module.minio_app]

  domain = var.console_domain
}

resource "uberspace_web_backend" "minio_console" {
  depends_on = [uberspace_web_domain.minio_console]

  uri  = "${var.console_domain}/"
  port = var.console_port
}
