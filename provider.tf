terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.7.0"
    }

    okta = {
      source  = "okta/okta"
      version = "3.31.0"
    }
  }
}


// set as ENV
provider "vault" {
  namespace = "admin"
}

/*
provider "okta" {
  org_name  = var.okta_org_name
  base_url  = var.okta_base_url
  api_token = var.okta_api_token
}
*/