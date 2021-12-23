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
      }

      env {
        HOSTNAME      = "${name}"
        RCON_PASSWORD = "${rcon_password}"
        SERVER_ADMIN  = "${admin_contact}"
      }

      resources {
        cpu    = ${cpu}
        memory = ${memory}
      }

      service {
        meta = {
          %{for key, value in service_meta}
          "${key}" = "${value}"
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
