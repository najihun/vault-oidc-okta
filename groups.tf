locals {
  child_namespaces = toset(var.child_namespaces)
}


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


// external group for a-team
resource "vault_identity_group" "okta-group-a-team" {
  name     = "okta-group-a-team"
  type     = "external"
  policies = [vault_policy.developer-policy.name]

  metadata = {
    responsibility = "okta-group-a-team"
  }
}

// external group alias for okta developers
resource "vault_identity_group_alias" "okta-group-a-team-alias" {
  name           = "okta-group-a-team"
  mount_accessor = vault_jwt_auth_backend.okta_oidc.accessor
  canonical_id   = vault_identity_group.okta-group-a-team.id
}

// external group for b-team
resource "vault_identity_group" "okta-group-b-team" {
  name     = "okta-group-b-team"
  type     = "external"
  policies = [vault_policy.developer-policy.name]

  metadata = {
    responsibility = "okta-group-b-team"
  }
}

// external group alias for okta developers
resource "vault_identity_group_alias" "okta-group-b-team-alias" {
  name           = "okta-group-b-team"
  mount_accessor = vault_jwt_auth_backend.okta_oidc.accessor
  canonical_id   = vault_identity_group.okta-group-b-team.id
}

resource "vault_identity_group" "a-team-ns-group" {
  name     = "a-team-ns-group"
  namespace = vault_namespace.children[locals.child_namespaces[0]].path_fq
  policies = [vault_policy.a-team-policy.name]
  member_group_ids = [vault_identity_group.okta-group-a-team.id]

  metadata = {
    responsibility = "okta-group-a-team"
  }
}

resource "vault_identity_group" "b-team-ns-group" {
  name     = "b-team-ns-group"
  namespace = vault_namespace.children[locals.child_namespaces[1]].path_fq
  policies = [vault_policy.b-team-policy.name]
  member_group_ids = [vault_identity_group.okta-group-b-team.id]

  metadata = {
    responsibility = "okta-group-b-team"
  }
}

resource "vault_identity_group" "shared-team-group" {
  name     = "shared-team-a-group"
  namespace = vault_namespace.children[locals.child_namespaces[2]].path_fq
  policies = [vault_policy.shared-team-policy.name]
  member_group_ids = [
    vault_identity_group.okta-group-a-team.id,
    vault_identity_group.okta-group-b-team.id
  ]

  metadata = {
    responsibility = "both"
  }
}