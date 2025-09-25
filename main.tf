terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull Docker image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create container from image
resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx.name   # ✅ FIXED
  ports {
    internal = 80
    external = 8080
  }
}
