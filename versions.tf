terraform {
  required_version = ">= 1.2.7"
  cloud {
    organization = "cklewar-f5-xc-modules"
    hostname     = "app.terraform.io"

    workspaces {
      tags = ["networking", "source:cli"]
    }
  }

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = ">= 0.11.11"
    }

    local = ">= 2.2.3"
    null  = ">= 3.1.1"
  }
}