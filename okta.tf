resource "vault_jwt_auth_backend" "okta_oidc" {
  description        = "Okta OIDC"
  path               = var.okta_mount_path
  type               = "oidc"
  oidc_discovery_url = var.okta_discovery_url
  bound_issuer       = var.okta_discovery_url
}

resource "vault_jwt_auth_backend_role" "okta_role" {
    backend = vault_jwt_auth_backend.okta_oidc.path
    role_name = "vault-role-okta-default"
    allowed_redirect_uris = [
        var.okta_redirect_uris,
        "http://localhost:8250/oidc/callback"
    ]

    role_type       = "oidc"
    user_claim = "sub"
//   token_policies = ["default"]
}


/*
resource "vault_jwt_auth_backend_role" "okta_role" {
  for_each       = var.roles
  backend        = vault_jwt_auth_backend.okta_oidc.path
  role_name      = each.key
  token_policies = each.value.token_policies

  allowed_redirect_uris = [
    "${var.vault_addr}/ui/vault/auth/${vault_jwt_auth_backend.okta_oidc.path}/oidc/callback",

    # This is for logging in with the CLI if you want.
    "http://localhost:${var.cli_port}/oidc/callback",
  ]

  user_claim      = "email"
  role_type       = "oidc"
  bound_audiences = var.okta_bound_audiences
  oidc_scopes = [
    "openid",
    "profile",
    "email",
  ]
  bound_claims = {
    groups = join(",", each.value.bound_groups)
  }
}
*/