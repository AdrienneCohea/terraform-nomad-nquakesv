# terraform-nquakesv-nomad
Run Quake as a container in Nomad. The implementation uses [nQuake server](https://hub.docker.com/r/niclaslindstedt/nquakesv) by 
[Niclas Lindstedt](https://github.com/niclaslindstedt)

# Example usage

```
module "quake" {
  source = "AdrienneCohea/nquakesv/nomad"
}
```

# Future work

- Support running under containerd
