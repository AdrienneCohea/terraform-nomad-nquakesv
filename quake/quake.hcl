job "quake" {
  datacenters = ["${datacenter}"]

  group "main" {
    count = 1

    network {
      mode = "bridge"

      port "quake" {
        to = 27500
      }
    }

    task "nquakesv" {
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

      driver = "docker"

      config {
        image = "niclaslindstedt/nquakesv"
      }

      env {
        RCON_PASSWORD = "${rcon_password}"
      }
    }
  }
}
