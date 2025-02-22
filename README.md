# Terraform Modules for uberspace apps

This repository contains terraform modules to deploy apps on uberspace.

See the respective submodules for more information.

## Main Module

The main module can be used to deploy any binary app on uberspace.

### Usage

```terraform
terraform {
  required_providers {
    uberspace = {
      source  = "uberspace-community/uberspace"
      version = "~> 0.1.0"
    }
  }
}

module "example" {
  source  = "uberspace-community/app/uberspace"
  version = "~> 0.0.2"

  binary_path = "server"
  binary_hash = filesha256("server")
  domain      = "example.isabell.example"
  port        = 9090
  args        = "9090"
  environment = {
    "EXAMPLE" = "example"
  }
}
```