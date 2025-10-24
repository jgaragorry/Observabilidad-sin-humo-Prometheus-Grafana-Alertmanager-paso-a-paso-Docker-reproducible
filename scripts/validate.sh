#!/bin/bash

echo "🔍 Validando estructura completa del workshop..."

# Archivos raíz
echo "📁 Verificando archivos raíz..."
[ -f docker-compose.yml ] && echo "✔ docker-compose.yml OK" || echo "❌ docker-compose.yml faltante"
[ -f README.md ] && echo "✔ README.md OK" || echo "❌ README.md faltante"
[ -f README-GUIA.md ] && echo "✔ README-GUIA.md OK" || echo "❌ README-GUIA.md faltante"
[ -f README-STEPS.md ] && echo "✔ README-STEPS.md OK" || echo "❌ README-STEPS.md faltante"
[ -f README-TEST.md ] && echo "✔ README-TEST.md OK" || echo "❌ README-TEST.md faltante"

# Prometheus
echo "📦 Verificando configuración de Prometheus..."
[ -d prometheus ] && echo "✔ carpeta prometheus OK" || echo "❌ carpeta prometheus faltante"
[ -f prometheus/prometheus.yml ] && echo "✔ prometheus.yml OK" || echo "❌ prometheus.yml faltante"
[ -f prometheus/alert.rules.yml ] && echo "✔ alert.rules.yml OK" || echo "❌ alert.rules.yml faltante"

# Alertmanager
echo "📣 Verificando configuración de Alertmanager..."
[ -d alertmanager ] && echo "✔ carpeta alertmanager OK" || echo "❌ carpeta alertmanager faltante"
[ -f alertmanager/config.yml ] && echo "✔ config.yml OK" || echo "❌ config.yml faltante"

# Grafana
echo "📊 Verificando configuración de Grafana..."
[ -d grafana/provisioning/datasources ] && echo "✔ carpeta datasources OK" || echo "❌ carpeta datasources faltante"
[ -f grafana/provisioning/datasources/datasource.yml ] && echo "✔ datasource.yml OK" || echo "❌ datasource.yml faltante"
[ -d grafana/provisioning/dashboards ] && echo "✔ carpeta dashboards OK" || echo "❌ carpeta dashboards faltante"
[ -f grafana/provisioning/dashboards/dashboard.yml ] && echo "✔ dashboard.yml OK" || echo "❌ dashboard.yml faltante"
[ -f grafana/provisioning/dashboards/node.json ] && echo "✔ node.json OK" || echo "❌ node.json faltante"

# Scripts
echo "🔐 Verificando permisos de ejecución en scripts..."
for script in scripts/*.sh; do
  [ -x "$script" ] && echo "✔ $script es ejecutable" || echo "❌ $script no tiene permisos de ejecución"
done

echo ""
echo "✅ Validación completa. El entorno está listo para ejecutar el workshop."

