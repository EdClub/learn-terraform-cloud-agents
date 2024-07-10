variable "pm_api_url" {
  description = "The API URL for the Proxmox provider"
  type        = string
  sensitive   = true
}

variable "pm_api_token_id" {
  description = "The API token ID for the Proxmox provider"
  type        = string
  sensitive   = true
}

variable "pm_api_token_secret" {
  description = "The API token secret for the Proxmox provider"
  type        = string
  sensitive   = true
}


provider "null" {}




resource "null_resource" "pm_api_url" {
  provisioner "local-exec" {
    command = "echo ${pm_api_url}"
  }
}

output "keyA_value" {
  value = local.pm_api_url
}
