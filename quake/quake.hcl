job "quake" {
  datacenters = ["${datacenter}"]

  group "main" {
    count = 1

    network {
      mode = "bridge"

      port "quake" {
        %{if static_port != 0}static = ${static_port}%{endif}
        to     = 27500
      }
    }

    task "nquakesv" {
      driver = "docker"

      config {
        image = "niclaslindstedt/nquakesv"
        entrypoint = ["/local/entrypoint.sh"]
      }

      template {
        data        = <<EOF
${ktx}
EOF
        destination = "local/ktx.cfg"
      }

      template {
        data        = <<EOF
${mvdsv}
EOF
        destination = "local/mvdsv.cfg"
      }

      template {
        data        = <<EOF
${pwd}
EOF
        destination = "local/pwd.cfg"
      }

      template {
        data        = <<EOF
${server}
EOF
        destination = "local/server.cfg"
      }

      template {
        data        = <<EOF
${entrypoint}
EOF
        destination = "local/entrypoint.sh"
        perms = "755"
      }

      resources {
        cpu    = ${cpu}
        memory = ${memory}
      }

      service {
        meta {
          %{for key, value in service_meta}
          ${key} = "${value}"
          %{endfor}
        }

        port = "quake"

        check {
          type     = "tcp"
          port     = "quake"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
