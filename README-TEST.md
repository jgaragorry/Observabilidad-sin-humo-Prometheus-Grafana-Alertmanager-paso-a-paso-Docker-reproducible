# 🧪 Validación funcional del workshop

Este documento registra las pruebas reales realizadas para verificar que el entorno del workshop funciona correctamente, que las alertas se disparan y que los dashboards se cargan como se espera.

---

## ✅ Validación 1: Dashboard Grafana

**Prueba:** Verificar que el dashboard `Node Exporter Alerts` se carga automáticamente al iniciar Grafana.

**Resultado:**  
✔ Dashboard cargado correctamente  
✔ No aparece el error `"Dashboard title cannot be empty"`  
✔ Paneles muestran métricas reales

**Acceso:**  
http://localhost:3000 (usuario: admin / contraseña: admin)

---

## ✅ Validación 2: Collector `filesystem` en Node Exporter

**Prueba:** Verificar logs de Node Exporter y comportamiento del collector `filesystem`.

**Resultado original:**  
❌ Error recurrente en los logs:
```
collector failed name=filesystem err="malformed mount point information"
```

**Diagnóstico:**  
Este error ocurre en entornos como WSL2 o Docker con Snap, donde los puntos de montaje del sistema de archivos no son compatibles con el collector `filesystem`.

**Corrección aplicada:**  
Se desactivó el collector `filesystem` en `docker-compose.yml` usando:

```yaml
command:
  - '--no-collector.filesystem'
```

**Resultado tras corrección:**  
✔ Error eliminado de los logs  
✔ Node Exporter sigue recolectando métricas del sistema  
✔ Entorno más limpio y didáctico para estudiantes

**⚠️ Advertencia reproducible:**  
En entornos WSL2 o Docker con Snap, se recomienda desactivar el collector `filesystem` para evitar ruido en los logs y mantener la reproducibilidad del workshop.

---

## ✅ Validación 3: Nombres de contenedores

**Prueba:** Verificar que los scripts pueden ejecutar comandos dentro de los contenedores.

**Resultado original:**  
❌ Error `"No such container"` en `validate-all.sh`, `debug.sh` y `test-alert.sh`

**Diagnóstico:**  
Docker Compose generaba nombres automáticos para los contenedores. Los scripts esperaban nombres explícitos (`prometheus`, `grafana`, etc.)

**Corrección aplicada:**  
Se agregó `container_name:` en `docker-compose.yml` para cada servicio.

**Resultado tras corrección:**  
✔ Scripts pueden ejecutar comandos correctamente  
✔ Validación integral funciona sin errores

---

## ✅ Validación 4: Scripts `debug.sh` y `test-alert.sh`

**Prueba:** Ejecutar diagnóstico de conectividad y simulación de alerta.

**Correcciones aplicadas:**
- `debug.sh` usa `wget` en lugar de `curl`
- `test-alert.sh` valida si la alerta existe antes de parsear con `jq`

**Resultado:**
✔ `debug.sh` confirma conectividad entre servicios  
✔ `test-alert.sh` muestra mensaje claro si la alerta no está disparada  
✔ Ambos scripts son ahora didácticos y reproducibles

---

## 🧪 Validación final

**Script:** `validate-all.sh`  
✔ Verifica estructura, conectividad y propagación  
✔ Ideal para confirmar que el entorno está listo para enseñar

---

Este archivo se actualiza con cada validación real del workshop. Cada error corregido se documenta como parte del proceso didáctico y reproducible.

