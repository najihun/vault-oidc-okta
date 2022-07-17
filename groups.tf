// external group for okta developers
resource "vault_identity_group" "okta-group-vault-developer" {
  name     = "okta-group-vault-developer"
  type     = "external"
  policies = [vault_policy.developer-policy.name]

  metadata = {
    responsibility = "okta-group-vault-developer"
  }
}
