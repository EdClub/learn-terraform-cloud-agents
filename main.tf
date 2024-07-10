provider "null" {}

variable "keyA" {
  description = "The environment variable keyA"
  type        = string
}

locals {
  keyA = var.keyA != "" ? var.keyA : (lookup(var.env, "keyA", ""))
}

resource "null_resource" "get_keyA" {
  provisioner "local-exec" {
    command = "echo ${local.keyA}"
  }
}

output "keyA_value" {
  value = local.keyA
}


