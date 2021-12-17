# terraform-nquakesv-nomad
Quake: Coming to a Terraform registry near uwu

# Example usage

```
module "quake" {
  source = "AdrienneCohea/nquakesv/nomad"

  rcon_password = random_password.rcon.result
}

resource "random_password" "rcon" {
  length = 24
}

```
