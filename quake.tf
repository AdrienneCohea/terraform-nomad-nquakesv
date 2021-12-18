resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    datacenter    = var.datacenter
    static_port   = var.static_port
    rcon_password = coalesce(var.rcon_password, random_password.rcon.result)
    service_meta = merge({
      protocol = "udp"
      port     = 27500
    }, var.service_meta)
  })
}
