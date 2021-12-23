# terraform-nquakesv-nomad
Run Quake as a container in Nomad. The implementation uses [nQuake server](https://hub.docker.com/r/niclaslindstedt/nquakesv) by 
[Niclas Lindstedt](https://github.com/niclaslindstedt)

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

# Future work

- Support running under containerd
- Custom entrypoint
- Lift configuration files out into map variables
