# LADR-0001: Выбор системы мониторинга

## Статус

Принято

## Контекст

Для тестового окружения Instahelper требуется система мониторинга,
которая позволит:

- собирать метрики с серверов;
- собирать метрики контейнеров Docker;
- отслеживать состояние сервисов;
- визуализировать состояние инфраструктуры;
- быстро разворачивать решение в Yandex Cloud;
- использовать open-source инструменты.

Также решение должно легко масштабироваться
для нескольких окружений.

## Решение

В качестве системы мониторинга выбраны:

- Prometheus — для хранения и сбора метрик;
- Grafana — для визуализации;
- node_exporter — для метрик сервера;
- cAdvisor — для метрик Docker-контейнеров.

Развертывание выполняется с помощью:

- Terraform — создание инфраструктуры;
- Ansible — настройка сервисов.

## Причины выбора

### Prometheus

Преимущества:

- стандарт де-факто для мониторинга;
- native поддержка формата Prometheus metrics;
- простой deployment;
- удобный pull-based scraping;
- интеграция с Grafana.

### Grafana

Преимущества:

- удобные dashboards;
- поддержка Prometheus;
- быстрый старт;
- возможность отображать метрики по окружениям.

### node_exporter

Используется для сбора:

- CPU;
- RAM;
- filesystem;
- network.

### cAdvisor

Используется для:

- мониторинга Docker-контейнеров;
- сбора container metrics;
- отслеживания состояния сервисов.

## Последствия

Положительные:

- централизованный мониторинг;
- простое масштабирование;
- быстрое добавление новых сервисов;
- удобная визуализация;
- open-source решение.

Отрицательные:

- требуется отдельный monitoring server;
- необходимо поддерживать exporters;
- Grafana dashboards создаются вручную.

## Схема

Application Server:
- Docker service
- node_exporter
- cAdvisor

Monitoring Server:
- Prometheus
- Grafana

Prometheus periodically scrapes metrics
from exporters and applications.

Grafana uses Prometheus as datasource.
