resource "nomad_job" "quake" {
  jobspec = templatefile("${path.module}/quake/quake.hcl", {
    datacenter   = var.datacenter
    static_port  = var.static_port
    cpu          = var.cpu
    memory       = var.memory
    service_meta = local.service_meta
    ktx          = templatefile("${path.module}/quake/ktx.cfg.tpl", local.ktx)
    mvdsv        = templatefile("${path.module}/quake/mvdsv.cfg.tpl", local.mvdsv)
    pwd          = templatefile("${path.module}/quake/pwd.cfg.tpl", local.passwords)
    server       = file("${path.module}/quake/server.cfg.tpl")
    entrypoint   = file("${path.module}/quake/entrypoint.sh")
  })

  hcl2 {
    enabled = true
  }
}

locals {
  ktx = {
    name       = var.name
    report_url = var.report_url
    report_key = var.report_key
  }

  mvdsv = {
    name          = var.name
    admin_contact = var.admin_contact
  }

  passwords = {
    rcon = coalesce(var.rcon_password, random_password.rcon.result)
    qtv  = coalesce(var.qtv_password, random_password.qtv.result)
  }

  service_meta = merge({
    protocol = "udp"
    port     = 27500
  }, var.service_meta)
}
