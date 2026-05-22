resource "yandex_compute_instance" "monitoring" {
  name        = "instahelper-monitoring"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd85f16aij1rvpce9gas"
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = "e9bav06350k91d444lf9"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}

output "monitoring_public_ip" {
  value = yandex_compute_instance.monitoring.network_interface[0].nat_ip_address
}

output "monitoring_internal_ip" {
  value = yandex_compute_instance.monitoring.network_interface[0].ip_address
}
