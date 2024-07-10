# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "null" {}

resource "null_resource" "get_keyA" {
  provisioner "local-exec" {
    command = "echo ${var.keyA}"
  }
}

variable "keyA" {
  description = "The environment variable keyA"
  type        = string
}

output "keyA_value" {
  value = var.keyA
}

