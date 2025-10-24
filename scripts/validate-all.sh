#!/bin/bash

echo "🧪 VALIDACIÓN INTEGRAL DEL WORKSHOP — OBSERVABILIDAD SIN HUMO"
echo "──────────────────────────────────────────────────────────────"

# Paso 1: Validar estructura y permisos
echo ""
echo "📁 Paso 1: Validando estructura y archivos..."
./scripts/validate.sh

# Paso 2: Verificar estado de contenedores y puertos
echo ""
echo "📦 Paso 2: Verificando estado de servicios..."
./scripts/status.sh

# Paso 3: Diagnóstico de conectividad entre servicios
echo ""
echo "🔗 Paso 3: Verificando conectividad interna..."
./scripts/debug.sh

# Paso 4: Simular alerta y verificar propagación
echo ""
echo "🚨 Paso 4: Simulando alerta y verificando propagación..."
./scripts/test-alert.sh

echo ""
echo "✅ VALIDACIÓN COMPLETA: El entorno está listo para enseñar, probar o reiniciar el workshop."

