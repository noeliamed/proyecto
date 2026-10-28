variable "base_image_web" {
  type    = string
  default = "debian13-base.qcow2"
}

variable "base_image_bd" {
  type    = string
  default = "ubuntu2604-base.qcow2"
}

variable "memory_web" {
  type    = number
  default = 1024
}

variable "memory_bd" {
  type    = number
  default = 1024
}

variable "ssh_public_key_file" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "usuario" {
  type    = string
  default = "admin"
}
