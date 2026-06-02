# Service

CI/CD для сервиса Instahelper.

## Pipeline

Pipeline выполняет:

1. build — сборка Docker image из `Final_project`
2. test — запуск тестов из `Final_project/run-tests.sh`
3. deploy — деплой через Ansible playbook `ansible/deploy.yml`

## Deploy

```bash
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml \
  -e service_name=instahelper-service \
  -e docker_image=skillbox/app \
  -e docker_tag=latest \
  -e service_port=80 \
  -e container_port=8080
