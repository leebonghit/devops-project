resource "yandex_compute_instance" "app" {
  name        = "instahelper-test-vm"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd85f16aij1rvpce9gas"
      size     = 15
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

resource "yandex_lb_target_group" "app" {
  name = "instahelper-target-group"

  target {
    subnet_id = "e9bav06350k91d444lf9"
    address   = yandex_compute_instance.app.network_interface[0].ip_address
  }
}

resource "yandex_lb_network_load_balancer" "app" {
  name = "instahelper-balancer"

  listener {
    name        = "http-listener"
    port        = 80
    target_port = 80

    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.app.id

    healthcheck {
      name = "http-healthcheck"

      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
