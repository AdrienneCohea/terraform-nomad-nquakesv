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
    vip_ip       = templatefile("${path.module}/quake/vip_ip.cfg.tpl", local.vip)
    server       = templatefile("${path.module}/quake/server.cfg.tpl", {})
    entrypoint   = templatefile("${path.module}/quake/entrypoint.sh", {})
  })

  hcl2 {
    enabled = true
  }

  lifecycle {
    ignore_changes = [allocation_ids]
  }
}

locals {
  ktx = {
    name       = var.name
    report_url = var.report_url
    report_key = var.report_key
    defmode    = var.modes.defmode
    mode       = var.modes.current
    map        = var.modes.map
    matchless  = var.modes.matchless ? 1 : 0
  }

  mvdsv = {
    name          = var.name
    admin_contact = var.admin_contact
  }

  passwords = {
    rcon = coalesce(var.rcon_password, random_password.rcon.result)
    qtv  = coalesce(var.qtv_password, random_password.qtv.result)
  }

  vip = {
    admin_client_ips = var.admin_client_ips
  }

  service_meta = merge({
    protocol = "udp"
    port     = 27500
  }, var.service_meta)
}
