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
  namespace = vault_namespace.children["a-team-ns"].path_fq
  policy = file("policies/a-team-policy.hcl")
}

resource "vault_policy" "b-team-policy" {
  name   = "b-team-policy"
  namespace = vault_namespace.children["b-team-ns"].path_fq
  policy = file("policies/b-team-policy.hcl")
}

resource "vault_policy" "shared-team-policy" {
  name   = "shared-team-policy"
  namespace = vault_namespace.children["share-ns"].path_fq
  policy = file("policies/shared-team-policy.hcl")
}