variable "admin_password" {
  type = string
}

variable "okta_mount_path" {
  type = string
  default = "okta"
}

variable "okta_discovery_url"{
  type = string
}

variable "okta_redirect_uris"{
  type = string
}