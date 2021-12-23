variable "name" {
  type        = string
  default     = "The Bad Place in Nomad"
  description = "Server name"
}
variable "admin_contact" {
  type        = string
  default     = "anon <anonymous@example.com>"
  description = "Admin contact (could be an email, a website, a GPG key idea, you get the idea)"
}

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

variable "cpu" {
  type        = number
  default     = 2000
  description = "CPU request"
}

variable "memory" {
  type        = number
  default     = 1024
  description = "Memory request"
}
