# LADR-0001 Monitoring System

## Status

Accepted

## Context

The Instahelper project requires monitoring for:
- virtual machines
- Docker containers
- application health
- infrastructure metrics

The monitoring solution must:
- support Prometheus metrics format
- be easy to deploy in Yandex Cloud
- integrate with Grafana
- support future scaling

## Decision

Prometheus was selected as the monitoring system.

Grafana was selected for visualization.

Node Exporter is used for VM metrics.

cAdvisor is used for Docker container metrics.

## Consequences

Advantages:
- native Prometheus ecosystem
- easy integration
- powerful querying language
- flexible dashboards
- cloud-native approach

Disadvantages:
- local storage only
- requires dashboard configuration
