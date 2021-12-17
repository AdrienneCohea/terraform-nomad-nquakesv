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
