resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    ktx = templatefile("${path.module}/quake/ktx.cfg.tpl", {
      name       = var.name
      report_url = var.report_url
      report_key = var.report_key
    })
    mvdsv = templatefile("${path.module}/quake/mvdsv.cfg.tpl", {
      name          = var.name
      admin_contact = var.admin_contact
    })
    pwd = templatefile("${path.module}/quake/pwd.cfg.tpl", {
      rcon = coalesce(var.rcon_password, random_password.rcon.result)
      qtv  = coalesce(var.qtv_password, random_password.qtv.result)
    })
    entrypoint  = file("${path.module}/quake/entrypoint.sh")
    datacenter  = var.datacenter
    static_port = var.static_port
    cpu         = var.cpu
    memory      = var.memory
    service_meta = merge({
      protocol = "udp"
      port     = 27500
    }, var.service_meta)
  })

  hcl2 {
    enabled = true
  }
}
