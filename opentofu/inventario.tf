resource "local_file" "inventario" {
  filename = "${path.module}/../ansible/hosts"
  content = templatefile("${path.module}/plantillas/inventario.tftpl", {
    usuario  = var.usuario
    web_ip   = try(libvirt_domain.vm["web"].network_interface[0].addresses[0], "")
    bd_ip    = try(libvirt_domain.vm["bd"].network_interface[0].addresses[0], "")
    web_datos = local.maquinas["web"].ip_datos
    bd_datos  = local.maquinas["bd"].ip_datos
  })
}
