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
  sensitive   = true
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
  sensitive = true
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "nginx"
  ports {
    internal = 80
    external = 8000
  }
}