#!/bin/bash

echo "🧰 INICIO COMPLETO DEL WORKSHOP — OBSERVABILIDAD SIN HUMO"
echo "────────────────────────────────────────────────────────────"

# Paso 1: Resetear entorno
echo ""
echo "🧹 Paso 1: Limpiando entorno anterior..."
./scripts/reset.sh

# Paso 2: Validar estructura
echo ""
echo "📁 Paso 2: Validando estructura y archivos..."
./scripts/validate.sh

# Paso 3: Levantar servicios
echo ""
echo "🚀 Paso 3: Iniciando servicios del stack..."
./scripts/start.sh

# Paso 4: Verificar estado
echo ""
echo "📦 Paso 4: Verificando estado de contenedores y puertos..."
./scripts/status.sh

# Paso 5: Mostrar logs en tiempo real
echo ""
echo "📋 Paso 5: Mostrando logs en tiempo real..."
./scripts/logs.sh

