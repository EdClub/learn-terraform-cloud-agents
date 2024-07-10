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

variable "keyA" {
  description = "The environment variable keyA"
  type        = string
  default     = ""
}

locals {
  keyA = var.keyA != "" ? var.keyA : (terraform.workspace != "default" ? "default_value" : "default_value")
}

resource "null_resource" "get_keyA" {
  provisioner "local-exec" {
    command = "echo ${local.keyA}"
  }
}

output "keyA_value" {
  value = local.keyA
}
