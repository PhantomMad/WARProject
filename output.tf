output "internal_ip_address" {
  value = yandex_compute_instance.VM.network_interface.0.ip_address
}
output "external_ip_address" {
  value = yandex_compute_instance.VM.network_interface.0.nat_ip_address
}