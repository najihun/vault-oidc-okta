// external group for okta developers
resource "vault_identity_group" "okta-group-vault-developer" {
  name     = "okta-group-vault-developer"
  type     = "external"
  policies = [vault_policy.developer-policy.name]

  metadata = {
    responsibility = "okta-group-vault-developer"
  }
}

// external group alias for okta developers
resource "vault_identity_group_alias" "okta-group-vault-developer-alias" {
  name           = "okta-group-vault-developer"
  mount_accessor = vault_jwt_auth_backend.okta_oidc.accessor
  canonical_id   = vault_identity_group.okta-group-vault-developer.id
}

// external group for okta admins
resource "vault_identity_group" "okta-group-vault-admins" {
  name     = "okta-group-vault-admins"
  type     = "external"
  policies = ["hcp-root"]

  metadata = {
    responsibility = "okta-group-vault-admins"
  }
}

// external group alias for okta developers
resource "vault_identity_group_alias" "okta-group-vault-admins-alias" {
  name           = "okta-group-vault-admins"
  mount_accessor = vault_jwt_auth_backend.okta_oidc.accessor
  canonical_id   = vault_identity_group.okta-group-vault-admins.id
}