output "rcon_password" {
  value     = local.passwords.rcon
  sensitive = true
}

output "qtv_password" {
  value     = local.passwords.qtv
  sensitive = true
}
