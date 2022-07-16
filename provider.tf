terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.7.0"
    }
  }
}


// set as ENV
provider "vault" {
  namespace = "admin"
}