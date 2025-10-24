#!/bin/bash
echo "📡 Simulando carga para disparar alertas..."
curl -s http://localhost:9100/metrics | grep node_load
echo "✅ Verifica en Grafana si se disparó la alerta."

