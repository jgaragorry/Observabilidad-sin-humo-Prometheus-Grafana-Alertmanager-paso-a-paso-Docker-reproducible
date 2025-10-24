#!/bin/bash
echo "🚨 Simulando condición de alerta para Prometheus..."

echo "🔍 Consultando estado de la alerta 'HighLoad'..."
response=$(docker exec prometheus wget -qO- http://localhost:9090/api/v1/alerts)

if echo "$response" | jq -e '.data.alerts | length > 0' > /dev/null; then
  echo "✔ Alerta detectada:"
  echo "$response" | jq '.data.alerts[] | {name: .labels.alertname, state: .state}'
else
  echo "⚠️ La alerta 'HighLoad' aún no está disparada. Espera unos segundos o fuerza carga en Node Exporter."
fi

