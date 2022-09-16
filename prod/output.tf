output "extprod_ip_address" {
  value = yandex_compute_instance.VMP.network_interface.0.nat_ip_address
}