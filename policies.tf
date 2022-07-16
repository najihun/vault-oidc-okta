resource "vault_policy" "admin-policy" {
  name   = "admin-policy"
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "developer-policy" {
  name   = "okta-developer-policy"
  policy = file("policies/okta-developer-policy.hcl")
}

