resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    name          = var.name
    admin_contact = var.admin_contact
    datacenter    = var.datacenter
    static_port   = var.static_port
    cpu           = var.cpu
    memory        = var.memory
    rcon_password = coalesce(var.rcon_password, random_password.rcon.result)
    service_meta = merge({
      protocol = "udp"
      port     = 27500
    }, var.service_meta)
  })
}
