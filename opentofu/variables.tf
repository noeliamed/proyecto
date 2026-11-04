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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyaD+nIfXWte9qdoslTgv9NHgn4f6X/+kdcIZnigfQpwJya3zmN1MF0+65CQr/uM+OarU+GiG5RDGiIuPO0qWBObGuTjXDAJq5cBLrrhww13J7SHhvFQ9KTDWxizQOVxemaSfOuaENv+4T0y5jldPYacLHFEoDXgcEOakSenJhnoDAHntyFxow30n+pic8DxXU6934uCvmqn8D3ZMu1gH4+DZ9FGtRBRdazKyFOPX/2Zu5DAlBf6z9sX6d1oFhoFz3lW/wUdQGqG3cz3vaP9PRJLCOr8atr1OHszA5ww/EDcLVTS6bY0dvzbmIbbF+Mn0XCRTRL78l68zvblJzqyvaFRLaZaYmd0EikKB2bD2oNNBQxaYydedunk5F6VDj18Egbq+RCnvYKE6KdKeNaUvTHqx1Yry+HcVbzct6W8I9QcKZc7BKp8P30mXCko8KMCCUnHS86lTAvDMIndYpMP2jG3z6m3dGm2POluxVv2SWJ5cDEeM06nMD8v1h9dE/PtpAPLMO6TPmc3X1UFmdYdxLPfRCytQNpcSBRNsw3PD6ObtAgTrd5cTugMGjzRB5bpBhV6TEmrsZO5f9CVP3SCZEAqbvni4N1dzETmWIe0YK9iJ7/xd9Hl0TpqO4p+YCHpO86kKTdeD427BvTB4P/Ig0MQzmwT8hCWeMz4PG8dQ/lw== noelia@debian"
}

variable "usuario" {
  type    = string
  default = "ansible"
}
