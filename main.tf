variable "pm_api_url" {
  description = "The API URL for the Proxmox provider"
  type        = string
}

variable "pm_api_token_id" {
  description = "The API token ID for the Proxmox provider"
  type        = string
}

variable "pm_api_token_secret" {
  description = "The API token secret for the Proxmox provider"
  type        = string
  sensitive   = false
}

provider "null" {}

resource "null_resource" "print_pm_api_url" {
  provisioner "local-exec" {
    command = "echo ${var.pm_api_url}"
  }
}

output "pm_api_url_value" {
  value     = var.pm_api_url
  sensitive = false
}

output "pm_api_token_id_value" {
  value     = var.pm_api_token_id
  sensitive = true
}

output "pm_api_token_secret_value" {
  value     = var.pm_api_token_secret
  sensitive = false
}

