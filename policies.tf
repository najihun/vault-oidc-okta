resource "vault_policy" "admin-policy" {
  name   = "admin-policy"
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "developer-policy" {
  name   = "okta-developer-policy"
  policy = file("policies/okta-developer-policy.hcl")
}

resource "vault_policy" "a-team-policy" {
  name   = "a-team-policy"
  policy = file("policies/a-team-policy.hcl")
}

resource "vault_policy" "b-team-policy" {
  name   = "b-team-policy"
  policy = file("policies/b-team-policy.hcl")
}

resource "vault_policy" "shared-team-policy" {
  name   = "shared-team-policy"
  policy = file("policies/shared-team-policy.hcl")
}