locals {
  ssh_key = trimspace(file(pathexpand(var.ssh_public_key_file)))
  maquinas = {
    web = { imagen = var.base_image_web, memoria = var.memory_web, ip_datos = "10.10.10.11" }
    bd  = { imagen = var.base_image_bd,  memoria = var.memory_bd,  ip_datos = "10.10.10.12" }
  }
}

resource "libvirt_network" "nat" {
  name      = "proy-nat"
  mode      = "nat"
  addresses = ["192.168.100.0/24"]
  dhcp { enabled = true }
}

resource "libvirt_network" "datos" {
  name = "proy-datos-aislada"
  mode = "none"
}

resource "libvirt_volume" "disco" {
  for_each         = local.maquinas
  name             = "${each.key}.qcow2"
  base_volume_name = each.value.imagen
  pool             = "default"
  size             = 10737418240
}

resource "libvirt_cloudinit_disk" "init" {
  for_each = local.maquinas
  name     = "${each.key}-init.iso"
  pool     = "default"
  user_data = templatefile("${path.module}/plantillas/user-data.yaml.tftpl", {
    hostname = each.key
    usuario  = var.usuario
    ssh_key  = local.ssh_key
  })
  network_config = templatefile("${path.module}/plantillas/network-config.yaml.tftpl", {
    ip_datos = each.value.ip_datos
  })
}

resource "libvirt_domain" "vm" {
  for_each  = local.maquinas
  name      = each.key
  memory    = each.value.memoria
  vcpu      = 1
  cloudinit = libvirt_cloudinit_disk.init[each.key].id

  network_interface {
    network_id     = libvirt_network.nat.id
    wait_for_lease = true
  }
  network_interface {
    network_id = libvirt_network.datos.id
  }

  disk {
    volume_id = libvirt_volume.disco[each.key].id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}
