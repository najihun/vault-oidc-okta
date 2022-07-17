// auth_method: oidc path:okta
resource "vault_jwt_auth_backend" "okta_oidc" {
  description        = "Okta OIDC"
  path               = var.okta_mount_path
  type               = "oidc"
  oidc_client_id = var.okta_client_id
  oidc_client_secret = var.okta_client_secret
  oidc_discovery_url = var.okta_discovery_url
  bound_issuer       = var.okta_discovery_url
  tune {
    listing_visibility = "unauth"
    token_type         = var.okta_token_type
  }
  
}

// test role to verify integration with Okta
resource "vault_jwt_auth_backend_role" "okta_role" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ "api://default", var.okta_client_id, ]
    role_name = "vault-role-okta-default"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
}

// developer role
resource "vault_jwt_auth_backend_role" "vault-role-okta-group-vault-developer" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ "api://default", var.okta_client_id, ]
    role_name = "vault-role-okta-group-vault-developer"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
    oidc_scopes = [ "groups" ]
    groups_claim = "groups"
}

