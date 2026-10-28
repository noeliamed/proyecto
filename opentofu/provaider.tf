terraform {
  required_provaiders {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.8.3"
    }
    local = { 
      source = "hashicorp/local"
    } 
  }
}

provaider "libvirt" {
  uri = "qemu://system"
}
