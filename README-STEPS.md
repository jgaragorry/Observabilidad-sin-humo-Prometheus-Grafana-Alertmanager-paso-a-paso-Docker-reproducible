# 🧪 Ejecución paso a paso del workshop — Observabilidad sin humo

Este documento guía la ejecución completa del workshop, asegurando que cada fase sea reproducible, didáctica y funcional. Incluye validaciones reales, correcciones aplicadas y recomendaciones para entornos livianos como WSL2 o Docker Desktop.

---

## 🔄 Paso 1: Resetear el entorno

```bash
./scripts/reset.sh
```

Este script elimina todos los contenedores, redes y volúmenes previos. Deja el entorno limpio para una ejecución reproducible.

---

## 🚀 Paso 2: Iniciar el entorno

```bash
./scripts/start.sh
```

Este script valida la estructura del proyecto y levanta los servicios:

- Prometheus → http://localhost:9090  
- Grafana → http://localhost:3000 (usuario: admin / contraseña: admin)  
- Alertmanager → http://localhost:9093  
- Node Exporter → http://localhost:9100  

---

## 🧪 Paso 3: Validar estructura y conectividad

```bash
./scripts/validate-all.sh
```

Este script verifica:

- Archivos y carpetas del proyecto  
- Puertos activos  
- Conectividad entre servicios  
- Simulación de alerta  

---

## 🔧 Paso 4: Diagnóstico de conectividad interna

```bash
./scripts/debug.sh
```

Este script fue corregido para usar `wget` en lugar de `curl`, ya que `curl` no está disponible en la imagen oficial de Prometheus.

**Resultado esperado:**

- ✔ Prometheus puede alcanzar Node Exporter  
- ✔ Prometheus puede alcanzar Alertmanager  
- ✔ Grafana puede alcanzar Prometheus  

---

## 🚨 Paso 5: Simular alerta y verificar propagación

```bash
./scripts/test-alert.sh
```

Este script fue corregido para validar si la alerta existe antes de parsear con `jq`, evitando errores cuando la alerta aún no está disparada.

**Resultado esperado:**

- ✔ Alerta `HighLoad` disparada  
- ✔ Estado `alerting` visible en Grafana  
- ✔ Panel de alerta activo en el dashboard  

---

## 🔥 Paso 6: Forzar carga para disparar la alerta

En entornos livianos, la carga promedio puede ser muy baja. Para simular carga y disparar la alerta:

```bash
for i in {1..4}; do yes > /dev/null & done
```

Esto genera carga continua en la CPU. Luego ejecuta:

```bash
./scripts/test-alert.sh
```

Y revisa Grafana → Alerting → Alert Rules → `High Load`

### Para detener la carga:

```bash
killall yes
```

---

## 📊 Paso 7: Verificar visualmente en Grafana

Accede a Grafana:

```text
http://localhost:3000
```

- Ve al dashboard `Node Exporter Alerts`  
- Verifica los paneles de CPU y memoria  
- Verifica el estado de la alerta en `Alerting > Alert Rules`  

---

## 🧠 Corrección aplicada: umbral de alerta

**Archivo:** `prometheus/alert.rules.yml`  
**Expr original:** `avg(node_load1) > 0.5`  
**Expr corregido:** `avg(node_load1) > 0.1`

**Justificación:**  
En entornos livianos, la carga promedio rara vez supera 0.5. Ajustar el umbral permite que la alerta se dispare sin necesidad de procesos artificiales, mejorando la experiencia didáctica.

---

## ✅ Validación final

Si todos los pasos anteriores funcionan, el entorno está:

- ✔ Validado  
- ✔ Reproducible  
- ✔ Listo para enseñar  

Este archivo se actualiza con cada mejora aplicada al workshop.

---

## 👨‍🏫 Autor y comunidad

**Autor:** José Garagorry  
**LinkedIn:** [linkedin.com/in/jgaragorry](https://linkedin.com/in/jgaragorry)  
**GitHub:** [github.com/jgaragorry](https://github.com/jgaragorry)  
**TikTok:** [@stclatam](https://www.tiktok.com/@softtraincorp)  
**Instagram:** [@stclatam](https://www.instagram.com/stclatam)  
**WhatsApp Comunidad:** [Únete aquí](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---

