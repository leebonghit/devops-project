resource "yandex_compute_instance" "prod_app" {
  name        = "instahelper-prod-vm"
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
    subnet_id = "e9ba9akvqha3i2s6if0e"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }
}

resource "yandex_lb_target_group" "prod_app" {
  name = "instahelper-prod-target-group"

  target {
    subnet_id = "e9ba9akvqha3i2s6if0e"
    address   = yandex_compute_instance.prod_app.network_interface[0].ip_address
  }
}

resource "yandex_lb_network_load_balancer" "prod_app" {
  name = "instahelper-prod-balancer"

  listener {
    name        = "prod-http-listener"
    port        = 80
    target_port = 80

    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.prod_app.id

    healthcheck {
      name = "prod-http-healthcheck"

      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

output "prod_vm_public_ip" {
  value = yandex_compute_instance.prod_app.network_interface[0].nat_ip_address
}

output "prod_vm_internal_ip" {
  value = yandex_compute_instance.prod_app.network_interface[0].ip_address
}

output "prod_load_balancer_ip" {
  value = one(flatten([
    for listener in yandex_lb_network_load_balancer.prod_app.listener : [
      for spec in listener.external_address_spec :
      spec.address
      if listener.name == "prod-http-listener"
    ]
  ]))
}
