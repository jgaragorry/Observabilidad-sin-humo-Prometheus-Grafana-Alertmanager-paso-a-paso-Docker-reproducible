#!/bin/bash

echo "📋 Mostrando logs en tiempo real de los servicios del workshop..."

docker compose logs -f --tail=50 prometheus grafana alertmanager node-exporter

