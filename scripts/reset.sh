#!/bin/bash

echo "🔄 Reiniciando entorno completo del workshop..."

# Apagar y eliminar contenedores del proyecto
echo "🧹 Deteniendo y eliminando contenedores del stack..."
docker compose down --volumes --remove-orphans

# Eliminar contenedores huérfanos (no gestionados por Compose)
echo "🧼 Buscando contenedores huérfanos..."
orphans=$(docker ps -a --filter "label=workshop=observabilidad" -q)
if [ -n "$orphans" ]; then
  echo "⚠️ Eliminando contenedores huérfanos etiquetados como 'workshop=observabilidad'..."
  docker rm -f $orphans
else
  echo "✔ No se encontraron contenedores huérfanos etiquetados."
fi

# Eliminar redes personalizadas del proyecto
echo "🌐 Eliminando redes personalizadas del proyecto..."
docker network prune -f

# Eliminar volúmenes no utilizados
echo "🗑️ Eliminando volúmenes huérfanos..."
docker volume prune -f

echo "✅ Entorno limpio y listo para reconstruir."

