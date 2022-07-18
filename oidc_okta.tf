// auth_method: oidc path:okta
resource "vault_jwt_auth_backend" "okta_oidc" {
  path               = "okta"
  type               = "oidc"
  oidc_client_id   = var.okta_client_id
  oidc_client_secret = var.okta_client_secret
  oidc_discovery_url = var.okta_discovery_url
}

// developer role
resource "vault_jwt_auth_backend_role" "vault-role-okta-group-vault-developer" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ var.okta_client_id ]
    role_name = "vault-role-okta-group-vault-developer"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
    oidc_scopes = [ "groups" ]
    groups_claim = "groups"
    token_policies = [ "default" ]
}

resource "vault_jwt_auth_backend_role" "vault-role-okta-group-vault-admins" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ var.okta_client_id ]
    role_name = "vault-role-okta-group-vault-admins"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
    oidc_scopes = [ "groups" ]
    groups_claim = "groups"
    token_policies = [ "default" ]
}

// a-team-member
resource "vault_jwt_auth_backend_role" "vault-role-okta-group-a-team" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ var.okta_client_id ]
    role_name = "vault-role-okta-group-a-team"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
    oidc_scopes = [ "groups" ]
    groups_claim = "groups"
    token_policies = [ "default" ]
}

// b-team-member
resource "vault_jwt_auth_backend_role" "vault-role-okta-group-b-team" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    bound_audiences = [ var.okta_client_id ]
    role_name = "vault-role-okta-group-b-team"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback",
    ]
    role_type       = "oidc"
    user_claim = "sub"
    oidc_scopes = [ "groups" ]
    groups_claim = "groups"
    token_policies = [ "default" ]
}

