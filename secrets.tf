resource "random_password" "rcon" {
  length  = 24
  special = false
  upper   = false
  number  = true
}

resource "random_password" "qtv" {
  length  = 24
  special = false
  upper   = false
  number  = true
}
