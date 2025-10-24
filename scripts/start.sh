#!/bin/bash

echo "🧪 Validando entorno antes de iniciar..."
./scripts/validate.sh

echo "🚀 Iniciando entorno del workshop..."
docker compose up -d

echo "🌐 Accesos disponibles:"
echo "🔎 Prometheus → http://localhost:9090"
echo "📊 Grafana → http://localhost:3000 (usuario: admin / contraseña: admin)"
echo "📣 Alertmanager → http://localhost:9093"
echo "📡 Node Exporter → http://localhost:9100"

echo "✅ Entorno levantado. Revisa los servicios en tu navegador."

