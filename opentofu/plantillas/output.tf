output "ips" {
  value = {
    for nombre, vm in libvirt_domain.vm :
    nombre => {
      nat   = vm.network_interface[0].addresses[0]
      datos = local.maquinas[nombre].ip_datos
    }
  }
}
