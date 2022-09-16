output "extbuild_ip_address" {
  value = yandex_compute_instance.VMB.network_interface.0.nat_ip_address
}