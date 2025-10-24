# 🎙️ Guía del facilitador — Workshop Observabilidad sin humo

Este documento está diseñado para ti como presentador, docente o autor del workshop. Resume el propósito, herramientas, beneficios y funcionamiento técnico del proyecto, para que puedas explicarlo con claridad en video, clase o presentación.

---

## 🎯 Objetivo del workshop

Este workshop enseña **observabilidad real y reproducible** usando Prometheus, Grafana y Alertmanager. El objetivo es que cualquier estudiante o profesional pueda:

- Entender cómo se recolectan métricas del sistema
- Visualizar esas métricas en dashboards
- Configurar alertas que se disparan ante condiciones específicas
- Validar todo el flujo en tiempo real, sin humo ni magia

---

## 🧰 Herramientas y tecnologías utilizadas

| Herramienta       | Rol en el workshop                                |
|-------------------|----------------------------------------------------|
| Docker Compose    | Orquestación del stack completo                    |
| Prometheus        | Recolección de métricas y evaluación de alertas   |
| Node Exporter     | Exporta métricas del sistema host                  |
| Grafana           | Visualización de métricas y alertas                |
| Alertmanager      | Agrupamiento y gestión de alertas disparadas      |
| Bash Scripts      | Automatización de validaciones y simulaciones     |
| YAML              | Configuración declarativa de servicios y reglas   |

---

## 🧠 Beneficios para el estudiante y el presentador

- ✅ 100% reproducible en cualquier entorno (WSL2, Docker Desktop, Linux)
- ✅ Validado en ejecución real
- ✅ Documentado paso a paso
- ✅ Ideal para enseñar, practicar o presentar a reclutadores
- ✅ Cada error corregido se convierte en una lección didáctica

---

## 📁 Explicación de cada archivo clave

### 🔧 `docker-compose.yml`
- Orquesta los servicios: Prometheus, Grafana, Alertmanager, Node Exporter
- Define puertos, volúmenes, redes y nombres explícitos de contenedor
- Incluye argumentos como `--config.file` y `--no-collector.filesystem`

### 📊 `grafana/dashboards/node.json`
- Dashboard preconfigurado para visualizar CPU, memoria y alertas
- Se carga automáticamente al iniciar Grafana

### 📁 `grafana/dashboards/dashboard.yml`
- Provisiona el dashboard `node.json` al iniciar Grafana

### 📁 `grafana/datasources/datasource.yml`
- Define la conexión entre Grafana y Prometheus como fuente de datos

### 🔍 `prometheus/prometheus.yml`
- Configura Prometheus para recolectar métricas de `node-exporter`
- Define el `scrape_interval` y los targets

### 🚨 `prometheus/alert.rules.yml`
- Define reglas de alerta como `HighLoad`
- Usa expresiones PromQL como `avg(node_load1) > 0.1`
- Incluye `for: 30s` para evitar falsos positivos

### 📣 `alertmanager/config.yml`
- Configura cómo se agrupan y manejan las alertas disparadas
- En esta fase no se envían notificaciones externas, pero está listo para escalar

### 🧪 `scripts/debug.sh`
- Verifica conectividad entre servicios usando `wget`
- Muestra mensajes claros si hay problemas de red

### 🚨 `scripts/test-alert.sh`
- Simula la alerta `HighLoad`
- Verifica si está disparada y muestra su estado

### 🔄 `scripts/reset.sh` / `start.sh`
- Limpian y reinician el entorno completo
- Validan estructura y permisos antes de iniciar

---

## 🔄 Flujo técnico del workshop

1. **Node Exporter** recolecta métricas del sistema host
2. **Prometheus** consulta esas métricas cada 15 segundos
3. Si la carga supera el umbral, **Prometheus dispara una alerta**
4. La alerta se envía a **Alertmanager**, que la agrupa
5. **Grafana** visualiza métricas y estado de alertas en tiempo real
6. Los **scripts** permiten validar, simular y enseñar cada paso

---

## 🔥 Cómo simular carga para disparar la alerta

En entornos livianos, la carga promedio puede ser muy baja. Para simular carga y disparar la alerta:

```bash
for i in {1..4}; do yes > /dev/null & done
```

Esto genera carga continua en la CPU. Luego ejecuta:

```bash
./scripts/test-alert.sh
```

Y revisa Grafana → Alerting → Alert Rules → `High Load`

Para detener la carga:

```bash
killall yes
```

---

## 🧑‍🏫 Cómo presentar el workshop

1. Explica el objetivo: enseñar observabilidad sin humo
2. Muestra el stack con Docker Compose
3. Ejecuta `reset.sh` y `start.sh` para iniciar
4. Usa `validate-all.sh` para confirmar que todo está bien
5. Simula la alerta con `test-alert.sh`
6. Muestra el dashboard en Grafana
7. Explica cada archivo y cómo interactúan
8. Cierra mostrando que el entorno es reproducible y listo para enseñar

---

Este archivo es tu guión narrativo. Léelo antes de grabar, enseñar o presentar. Puedes convertirlo en slides, infografía o post para redes.

