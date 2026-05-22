output "vm_public_ip" {
  value = yandex_compute_instance.app.network_interface[0].nat_ip_address
}

output "vm_internal_ip" {
  value = yandex_compute_instance.app.network_interface[0].ip_address
}

output "load_balancer_ip" {
  value = one(flatten([
    for listener in yandex_lb_network_load_balancer.app.listener : [
      for spec in listener.external_address_spec :
      spec.address
      if listener.name == "http-listener"
    ]
  ]))
}
