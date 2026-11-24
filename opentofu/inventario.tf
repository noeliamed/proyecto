locals {
  grupos = ["servidores_web", "servidores_bd", "servidores_nas", "servidores_backup"]
}

resource "local_file" "inventario" {
  filename        = "${path.module}/../ansible/hosts"
  file_permission = "0644"
  content = templatefile("${path.module}/plantillas/inventario.tftpl", {
    usuario = var.usuario
    grupos  = local.grupos
    maquinas = {
      for nombre, m in local.maquinas : nombre => {
        grupo    = m.grupo
        ip_nat   = try(libvirt_domain.vm[nombre].network_interface[0].addresses[0], "")
        ip_datos = m.ip_datos
      }
    }
  })
}
