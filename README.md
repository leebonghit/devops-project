# DevOps Final Project

Финальный проект по курсу DevOps Engineer.

## Описание

Проект демонстрирует полный цикл развёртывания приложения и сопровождения инфраструктуры с использованием современных DevOps-практик.

В рамках проекта были реализованы:

- инфраструктура в Yandex Cloud через Terraform;
- автоматизация настройки серверов через Ansible;
- CI/CD-пайплайны GitLab;
- отдельные окружения UAT и PROD;
- мониторинг на базе Prometheus и Grafana;
- централизованный сбор логов через Loki и Promtail;
- Docker-контейнеризация сервисов;
- балансировка нагрузки.

## Структура проекта

```text
infra/
├── terraform/
├── ansible/
└── monitoring

service/
├── application source code
├── docker configuration
└── deployment configuration
```

## Используемые технологии

- Terraform
- Ansible
- Docker
- GitLab CI/CD
- Prometheus
- Grafana
- Loki
- Promtail
- Yandex Cloud
- Linux (Ubuntu)

## Реализованный функционал

### Infrastructure as Code

Инфраструктура создаётся и управляется через Terraform.

### Configuration Management

Настройка серверов и сервисов выполняется через Ansible playbooks.

### Continuous Integration / Continuous Delivery

Сборка, тестирование и доставка приложения выполняются автоматически через GitLab CI/CD.

### Monitoring

Настроен сбор системных метрик и отображение их в Grafana.

### Logging

Настроен централизованный сбор логов приложений и Docker-контейнеров через Loki и Promtail.

## Автор

Владимир Ли
