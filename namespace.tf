locals {
  child_namespaces = toset(var.child_namespaces)
}

resource "vault_namespace" "children" {
  for_each  = local.child_namespaces
  namespace = "admin"
  path      = each.key
}

resource "vault_namespace" "test"{
    path = "testtest"
}

