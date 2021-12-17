variable "datacenter" {
  type        = string
  default     = "dc1"
  description = "The Nomad datacenter in which to run Quake"
}

variable "rcon_password" {
  type        = string
  description = "The password for RCON (remote console)"
}
