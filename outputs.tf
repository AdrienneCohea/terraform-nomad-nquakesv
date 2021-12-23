output "rcon_password" {
  value     = random_password.rcon.result
  sensitive = true
}
