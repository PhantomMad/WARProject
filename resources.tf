resource "yandex_compute_instance" "VM" {
  name = "workmashine"

  resources {
    cores  = 4
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.size_hd
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  scheduling_policy {
    preemptible = true
  }
  metadata = {
    user-data = "${file("~workspace/WARProject/users.txt")}"
  }
}