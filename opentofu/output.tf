output "ips" {
  value = {
    for nombre, vm in libvirt_domain.vm :
    nombre => {
      nat   = try(vm.network_interface[0].addresses[0], "Sin IP")
      datos = local.maquinas[nombre].ip_datos
    }
  }
}
