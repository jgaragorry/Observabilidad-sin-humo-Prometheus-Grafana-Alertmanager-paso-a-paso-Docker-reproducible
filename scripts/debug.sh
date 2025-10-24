#!/bin/bash
echo "🧪 Diagnóstico de conectividad entre servicios del workshop observabilidad..."

echo "🔗 Probando conexión Prometheus → Node Exporter..."
if docker exec prometheus wget -q --spider http://node-exporter:9100; then
  echo "✔ Prometheus puede alcanzar Node Exporter"
else
  echo "❌ Prometheus NO puede alcanzar Node Exporter (wget no disponible o fallo de red)"
fi

echo "🔗 Probando conexión Prometheus → Alertmanager..."
if docker exec prometheus wget -q --spider http://alertmanager:9093; then
  echo "✔ Prometheus puede alcanzar Alertmanager"
else
  echo "❌ Prometheus NO puede alcanzar Alertmanager (wget no disponible o fallo de red)"
fi

echo "🔗 Probando conexión Grafana → Prometheus..."
if docker exec grafana wget -q --spider http://prometheus:9090; then
  echo "✔ Grafana puede alcanzar Prometheus"
else
  echo "❌ Grafana NO puede alcanzar Prometheus (wget no disponible o fallo de red)"
fi

