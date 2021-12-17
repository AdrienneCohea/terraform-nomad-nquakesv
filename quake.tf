resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    datacenter    = var.datacenter
    rcon_password = var.rcon_password
  })
}
