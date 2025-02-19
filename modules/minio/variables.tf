variable "domain" {
  description = "The domain to use for the app, ensure your DNS is set up correctly"
  type        = string
}

variable "console_domain" {
  description = "The domain to use for the app, ensure your DNS is set up correctly"
  type        = string
}

variable "port" {
  description = "The port the app listens on, ensure this is not already in use"
  type        = number
}

variable "console_port" {
  description = "The port the app listens on, ensure this is not already in use"
  type        = number
}

variable "minio_access_key" {
  description = "The access key for the Minio server"
  type        = string
}

variable "minio_secret_key" {
  description = "The secret key for the Minio server"
  type        = string
  sensitive   = true
}