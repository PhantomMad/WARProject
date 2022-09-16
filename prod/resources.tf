resource "yandex_compute_instance" "VMP" {
  name = "prodmashine"
  hostname = "prodvm"

  resources {
    cores  = 2
    memory = 2
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
    user-data = "${file("~/workspace/WARProject/prod/users.txt")}"
  }
}