provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "coreos_disk" {
  name = "coreos_vm.qcow2"
  pool = "default"
  source = "https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/38.20230806.3.0/x86_64/fedora-coreos-38.20230806.3.0-qemu.x86_64.qcow2"
  format = "qcow2"
}

resource "libvirt_domain" "coreos_vm" {
  name   = "coreos-k8s-node"
  memory = 4096
  vcpu   = 2

  disk {
    volume_id = libvirt_volume.coreos_disk.id
  }

  network_interface {
    network_name = "default"
  }

}
  cloudinit = "${path.module}/cloud-init.iso"