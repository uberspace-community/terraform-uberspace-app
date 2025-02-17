variable "binary_path" {
  description = "The path to the binary to deploy"
  type        = string
}

variable "binary_hash" {
  description = "The sha256sum of the binary"
  type        = string
}

variable "domain" {
  description = "The domain to use for the app, ensure your DNS is set up correctly"
  type        = string
}

variable "port" {
  description = "The port the app listens on, ensure this is not already in use"
  type        = number
}

variable "args" {
  description = "Arguments to pass to the binary"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment variables to set for the app"
  type        = map(any)
  default     = {}
}
