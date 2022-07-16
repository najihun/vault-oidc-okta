resource "vault_auth_backend" "userpass" {
    type = "userpass"
}

resource "vault_generic_endpoint" "admin-user" {
    depends_on  = [vault_auth_backend.userpass]
    path        = "auth/userpass/users/admin-user"
    ignore_absent_fields = true

    data_json = <<EOT
    {
      "policies" : ["admin-policy"],
      "password" : "${var.admin_password}"
    }
    EOT
}