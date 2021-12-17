# terraform-nquakesv-nomad
Run a Quake container in Nomad

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
