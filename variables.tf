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

variable "report_url" {
  type        = string
  default     = "https://badplace.eu"
  description = "URL to send match/race results to"
}

variable "report_key" {
  type        = string
  default     = "askmeag"
  description = "Report key credential. Contact meag to find out what string to put here."
}

variable "admin_client_ips" {
  type = list(string)
  description = "Ridiculous client IP-based authentication."
}

variable "modes" {
  type = object({
    defmode   = string
    current   = number
    map       = string
    matchless = bool
  })
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

variable "qtv_password" {
  type        = string
  default     = ""
  description = "The password for QTV"
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
