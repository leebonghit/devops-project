# Infra

Инфраструктура для тестового окружения Instahelper в Yandex Cloud.

## Что создаётся

- VM Ubuntu 22.04
- Network Load Balancer
- Target Group
- Ansible-код для установки Docker

## Terraform

```bash
cd terraform
export YC_TOKEN="$(yc iam create-token)"
terraform init
terraform validate
terraform apply
```

VM public IP: 51.250.13.181
VM internal IP: 192.168.10.10
Load Balancer IP: 89.169.129.139
