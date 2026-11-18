terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:alpine"

}

resource "docker_container" "nginx" {
  name  = "module13-nginx"
  image = docker_image.nginx.image_id
}