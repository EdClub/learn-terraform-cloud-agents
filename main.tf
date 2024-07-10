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
