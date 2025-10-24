#!/bin/bash

echo "📦 Estado de los contenedores del workshop observabilidad..."

docker ps --filter "label=workshop=observabilidad" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "🌐 Verifica accesos en tu navegador:"
echo "🔎 Prometheus → http://localhost:9090"
echo "📊 Grafana → http://localhost:3000"
echo "📣 Alertmanager → http://localhost:9093"
echo "📡 Node Exporter → http://localhost:9100"

echo ""
echo "🧪 Validación rápida de puertos locales:"
for port in 9090 3000 9093 9100; do
  nc -z localhost $port && echo "✔ Puerto $port activo" || echo "❌ Puerto $port no responde"
done

echo ""
echo "✅ Estado verificado. Si algún servicio no está activo, ejecuta ./scripts/start.sh"

