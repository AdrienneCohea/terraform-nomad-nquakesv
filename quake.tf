resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    datacenter    = var.datacenter
    rcon_password = var.rcon_password
    service_meta = merge({
      protocol = "udp"
      port     = 27500
    }, var.service_meta)
  })
}
