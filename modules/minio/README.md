# Terraform Module for Minio

This module deploys a Minio server on an uberspace.

See also https://lab.uberspace.de/guide_minio/, but note that the guide is outdated and the module is not based on it.

## Usage

```terraform
terraform {
  required_providers {
    uberspace = {
      source  = "uberspace-community/uberspace"
      version = "~> 0.1.0"
    }
  }
}


module "minio" {
  source  = "uberspace-community/app/uberspace//modules/minio"
  version = "~> 0.0.2"

  domain           = "minio.isabell.example"
  port             = 9091
  minio_access_key = "minio"
  minio_secret_key = var.password
  console_domain   = "minio-console.isabell.example"
  console_port     = 9092
}
```