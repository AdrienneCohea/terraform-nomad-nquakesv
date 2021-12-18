variable "datacenter" {
  type        = string
  default     = "dc1"
  description = "The Nomad datacenter in which to run Quake"
}

variable "static_port" {
  type        = number
  default     = 27500
  description = "Static port to use if the load balancer cannot have a different backend service port than the frontend port"
}

variable "rcon_password" {
  type        = string
  default     = ""
  description = "The password for RCON (remote console)"
}

variable "service_meta" {
  type        = map(string)
  default     = {}
  description = "Register the service in Consul with the given service metadata"
}
