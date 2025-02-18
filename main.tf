# todo: provision (4) virtual or physical ARM64 machines running Debian 12 (bookworm). 
# The following table list the four machines and thier CPU, memory, and storage requirements.

# | Name    | Description            | CPU | RAM   | Storage |
# |---------|------------------------|-----|-------|---------|
# | jumpbox | Administration host    | 1   | 512MB | 10GB    |
# | server  | Kubernetes server      | 1   | 2GB   | 20GB    |
# | node-0  | Kubernetes worker node | 1   | 2GB   | 20GB    |
# | node-1  | Kubernetes worker node | 1   | 2GB   | 20GB    |


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
