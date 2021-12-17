variable "datacenter" {
  type        = string
  default     = "dc1"
  description = "The Nomad datacenter in which to run Quake"
}

variable "rcon_password" {
  type        = string
  description = "The password for RCON (remote console)"
}

variable "service_meta" {
  type        = map(string)
  default     = {}
  description = "Register the service in Consul with the given service metadata"
}
