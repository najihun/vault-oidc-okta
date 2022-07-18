variable "admin_password" {
  type        = string
  description = "password for vault admin user instead of root token"
}

variable "okta_mount_path" {
  type        = string
  description = "if empty, auth method path would be oidc/"
}

variable "okta_discovery_url" {
  type        = string
  description = "Okta Authz server Issuer URI: i.e. https://<org>.okta.com/oauth2/<id>"
}

variable "okta_redirect_uris" {
  type        = string
  description = "{Vault_ADDR:8200}/ui/vault/auth/oidc/oidc/callback"
}

variable "okta_token_type" {
  type        = string
  description = "Token type for Vault Tokens"
  default     = "default-service"
}

variable "okta_client_id" {
  type        = string
  description = "okta client id"
}

variable "okta_client_secret" {
  type        = string
  description = "okta client secret"
}

variable "child_namespaces" {
  default = [
    "a-team-ns",
    "b-team-ns",
    "share-ns",
  ]
}